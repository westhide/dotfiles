{ config, pkgs, ... }:

{
  imports = [
    ../../pkgs
  ];

  home.stateVersion = "24.11";

  home = {
    username = "westhide";
    homeDirectory = "/home/westhide";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    packages = with pkgs;[
    ];
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Adwaita";
    };
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
    home-manager.enable = true;
  };
}
