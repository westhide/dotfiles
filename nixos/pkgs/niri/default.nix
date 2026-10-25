{ config, pkgs, libs, ... }:

{
  xdg.configFile.niri.source = libs.mkXdgConfigLink config "niri/config";

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}
