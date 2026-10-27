{ pkgs, ext, ... }:

{
  xdg.configFile."btop/btop.conf".source = ext.mklink "config/btop.conf";

  home.packages = with pkgs; [
    btop-cuda
  ];
}
