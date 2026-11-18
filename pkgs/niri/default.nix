{ pkgs, ext, ... }:

{
  xdg.configFile = {
    xkb.source = ext.mklink "xkb";
    niri.source = ext.mklink "config";

    "systemd/user/niri.service".source = "${pkgs.niri}/lib/systemd/user/niri.service";
    "systemd/user/niri-shutdown.target".source = "${pkgs.niri}/lib/systemd/user/niri-shutdown.target";
  };

  home.packages = with pkgs; [
    niri
    bibata-cursors
    xwayland-satellite
  ];

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.niri ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
