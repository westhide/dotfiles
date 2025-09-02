{ config, libs, ... }:

{
  xdg.configFile.wlogout.source = libs.mkXdgConfigLink config "wlogout/config";

  programs.wlogout = {
    enable = true;
  };
}
