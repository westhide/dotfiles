#!/usr/bin/env bash
set -euo pipefail

exec 9>"${XDG_RUNTIME_DIR:?}/niri-dingtalk-workspace.lock"
flock -n 9 || exit 0

state_file="$XDG_RUNTIME_DIR/niri-dingtalk-previous-workspace"
workspaces=$(niri msg --json workspaces)
current_name=$(jq -r '.[] | select(.is_focused) | .name // empty' <<< "$workspaces")

if [[ "$current_name" == dingtalk ]]; then
    previous=""
    if [[ -r "$state_file" ]]; then
        read -r previous < "$state_file" || true
    fi
    previous_index=$(jq -r --arg previous "$previous" \
        '.[] | select((.id | tostring) == $previous and .name != "dingtalk") | .idx' \
        <<< "$workspaces")
    if [[ -n "$previous_index" ]]; then
        niri msg action focus-workspace "$previous_index"
    else
        niri msg action focus-workspace-previous
    fi
    exit 0
fi

# Resolve the saved ID to the current index when returning.
jq -er '.[] | select(.is_focused) | .id' <<< "$workspaces" > "$state_file"
niri msg action focus-workspace dingtalk
windows=$(niri msg --json windows)
mapfile -t dingtalk_ids < <(jq -r '.[] | select(.app_id == "com.alibabainc.dingtalk") | .id' <<< "$windows")

if (( ${#dingtalk_ids[@]} == 0 )); then
    # Do not pass the lock to DingTalk; serialize key presses until its window opens.
    flatpak run com.dingtalk.DingTalk 9>&- &
    for ((attempt = 0; attempt < 50; attempt++)); do
        windows=$(niri msg --json windows)
        mapfile -t dingtalk_ids < <(jq -r '.[] | select(.app_id == "com.alibabainc.dingtalk") | .id' <<< "$windows")
        (( ${#dingtalk_ids[@]} > 0 )) && break
        sleep 0.1
    done
    if (( ${#dingtalk_ids[@]} == 0 )); then
        echo "DingTalk did not open within 5 seconds." >&2
        exit 1
    fi
fi

for id in "${dingtalk_ids[@]}"; do
    niri msg action move-window-to-workspace --window-id "$id" --focus false dingtalk
done
niri msg action focus-window --id "${dingtalk_ids[0]}"
