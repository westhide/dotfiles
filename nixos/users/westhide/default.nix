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
      feishu
    ];
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
    alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
      };
    };

    home-manager.enable = true;
  };
}
