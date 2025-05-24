{ config, pkgs, h, ... }:

{
  xdg.configFile.trippy.source = h.mkXdgConfigLink config "trippy/config";

  home.packages = with pkgs; [
    trippy
  ];
}
