{ config, pkgs, libs, ... }:

{
  xdg.configFile.trippy.source = libs.mkXdgConfigLink config "trippy/config";

  home.packages = with pkgs; [
    trippy
  ];
}
