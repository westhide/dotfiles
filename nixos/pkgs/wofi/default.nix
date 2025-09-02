{ config, libs, ... }:

{
  xdg.configFile.wofi.source = libs.mkXdgConfigLink config "wofi/config";

  programs.wofi = {
    enable = true;
  };
}
