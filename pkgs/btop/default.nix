{ pkgs, ... }:

{
  xdg.configFile."btop/btop.conf".source = ./config/btop.conf;

  home.packages = with pkgs; [
    btop
  ];
}
