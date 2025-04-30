{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  home = {
    username = "westhide";
    homeDirectory = "/home/westhide";

    sessionVariables = {
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
    btop = {
      enable = true;
    };
    git = {
      enable = true;
      lfs.enable = true;
      userName = "westhide";
      userEmail = "westhide.dev@gmail.com";
    };
    alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
      };
    };
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };

    home-manager.enable = true;
  };
}
