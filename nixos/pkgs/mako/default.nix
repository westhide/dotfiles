{ config, libs, ... }:

{
  xdg.configFile."mako/config".enable = false;
  xdg.configFile.mako.source = libs.mkXdgConfigLink config "mako/config";

  services.mako = {
    enable = true;
  };
}
