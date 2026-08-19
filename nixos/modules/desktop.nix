{ inputs, pkgs, ... }:

{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];

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
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
      };
    };
    flatpak = {
      enable = true;
    };
  };
}
