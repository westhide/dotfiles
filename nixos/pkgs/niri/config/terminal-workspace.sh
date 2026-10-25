#!/usr/bin/env bash
set -euo pipefail

[[ $# == 0 ]] || exit 1

exec 9>"${XDG_RUNTIME_DIR:?}/niri-terminal-workspace.lock"
flock -n 9 || exit 0

state_file="$XDG_RUNTIME_DIR/niri-terminal-previous-workspace"
workspaces=$(niri msg --json workspaces)
current_name=$(jq -r '.[] | select(.is_focused) | .name // empty' <<< "$workspaces")

if [[ "$current_name" == terminal ]]; then
    previous=""
    if [[ -r "$state_file" ]]; then
        read -r previous < "$state_file" || true
    fi
    previous_index=$(jq -r --arg previous "$previous" \
        '.[] | select((.id | tostring) == $previous and .name != "terminal") | .idx' \
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
niri msg action focus-workspace terminal
windows=$(niri msg --json windows)
mapfile -t terminal_ids < <(jq -r '.[] | select(.app_id == "niri-terminal") | .id' <<< "$windows")

if (( ${#terminal_ids[@]} == 0 )); then
    # Do not pass the lock to Alacritty; serialize key presses until its window opens.
    alacritty --class niri-terminal 9>&- &
    for ((attempt = 0; attempt < 50; attempt++)); do
        windows=$(niri msg --json windows)
        mapfile -t terminal_ids < <(jq -r '.[] | select(.app_id == "niri-terminal") | .id' <<< "$windows")
        (( ${#terminal_ids[@]} > 0 )) && break
        sleep 0.1
    done
    if (( ${#terminal_ids[@]} == 0 )); then
        echo "The dedicated terminal did not open within 5 seconds." >&2
        exit 1
    fi
fi

for id in "${terminal_ids[@]}"; do
    niri msg action move-window-to-workspace --window-id "$id" --focus false terminal
    niri msg action move-window-to-floating --id "$id"
    niri msg action set-window-width --id "$id" "85%"
    niri msg action set-window-height --id "$id" "85%"
    sleep 0.1
    niri msg action center-window --id "$id"
done
niri msg action focus-window --id "${terminal_ids[0]}"
