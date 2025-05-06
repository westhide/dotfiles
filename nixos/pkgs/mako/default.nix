{ config, h, ... }:

{
  xdg.configFile."mako/config".enable = false;
  xdg.configFile.mako.source = h.mkXdgConfigLink config "mako/config";

  services.mako = {
    enable = true;
  };
}
