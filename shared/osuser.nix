{ opts, ... }:

{
  imports = [
    ../pkgs
    ../hardware
  ];

  home = {
    username = opts.username;
    homeDirectory = "/home/${opts.username}";
    stateVersion = "26.11";
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;
}
