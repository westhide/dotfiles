{ opts, ... }:

{
  imports = [
    ../pkgs
  ];

  home = {
    username = opts.username;
    homeDirectory = "/home/${opts.username}";
    stateVersion = "26.11";
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
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  targets.genericLinux.enable = true;
}
