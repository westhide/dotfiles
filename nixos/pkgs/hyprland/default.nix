{ config, h, ... }:

{
  # xdg.configFile.hypr.source = h.mkXdgConfigLink config "hyprland/config";

  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };
}
