{ pkgs, ... }:

{
  xdg = {
    terminal-exec = {
      enable = true;
    };
    portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };
  };

  programs.hyprland = {
    enable = true;
    # withUWSM = true;
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili";
        extraPackages = with pkgs; [
          libsForQt5.qt5.qtgraphicaleffects
        ];
      };
    };
    rustdesk-server = {
      enable = true;
      openFirewall = true;
    };
  };
}
