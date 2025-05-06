{ config, h, ... }:

{
  xdg.configFile.wlogout.source = h.mkXdgConfigLink config "wlogout/config";
  programs.wlogout = {
    enable = true;
  };
}
