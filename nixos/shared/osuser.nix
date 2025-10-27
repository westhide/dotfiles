{ pkgs, opts, ... }:

{
  imports = [
    ../pkgs
  ];

  home.stateVersion = "25.05";

  home = {
    username = opts.username;
    homeDirectory = "/home/${opts.username}";

    pointerCursor = {
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
  };

  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ll = "ls -Alh --color=auto";
      };
    };
  };
}
