{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    nixd
  ];

  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
