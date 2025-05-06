{
  pkgs,
  opts,
  ...
}:

{
  imports = [
    ../../pkgs
  ];

  home.stateVersion = "24.11";

  home = {
    username = opts.username;
    homeDirectory = "/home/${opts.username}";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
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
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ll = "ls -Alh --color=auto";
      };
    };
    home-manager.enable = true;
  };
}
