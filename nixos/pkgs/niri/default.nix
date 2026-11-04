{ pkgs, ext, ... }:

{
  xdg.configFile.xkb.source = ext.mklink "xkb";
  xdg.configFile.niri.source = ext.mklink "config";

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}
