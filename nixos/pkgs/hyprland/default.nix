{
  config,
  pkgs,
  h,
  ...
}:

{
  xdg.configFile."hypr/hyprland.conf".enable = false;
  xdg.configFile.hypr.source = h.mkXdgConfigLink config "hyprland/config";

  home = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      HYPRSHOT_DIR = "$HOME/.cache/hyprshot";
    };
    packages = with pkgs; [
      hyprshot
    ];
  };

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
