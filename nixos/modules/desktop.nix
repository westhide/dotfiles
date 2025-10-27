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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili";
        extraPackages = with pkgs; [
          qt6.qt5compat
        ];
      };
    };
  };
}
