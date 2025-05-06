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

    packages = with pkgs; [
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
      shellAliases = {
        ll = "ls -Alh --color=auto";
      };
    };
    home-manager.enable = true;
  };
}
