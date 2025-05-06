{ config, h, ... }:

{
  xdg.configFile.wofi.source = h.mkXdgConfigLink config "wofi/config";

  programs.wofi = {
    enable = true;
  };
}
