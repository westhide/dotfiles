{ config, h, ... }:

{
  xdg.configFile."hypr/hyprland.conf".enable = false;
  xdg.configFile.hypr.source = h.mkXdgConfigLink config "hyprland/config";

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
      enableXdgAutostart = true;
    };
    settings = { };
  };
}
