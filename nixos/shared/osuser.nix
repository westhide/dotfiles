{ config, pkgs, opts, ... }:

{
  imports = [
    ../pkgs
  ];

  home.stateVersion = "24.11";

  home = {
    username = opts.username;
    homeDirectory = "/home/${opts.username}";

    pointerCursor = {
      enable = true;
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 14;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk4.theme = config.gtk.theme;
  };

  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
      historySize = -1;
      historyFileSize = -1;
      historyControl = [
        "ignoredups"
      ];
      shellAliases = {
        ll = "ls -Alh --color=auto";
      };
    };
  };
}
