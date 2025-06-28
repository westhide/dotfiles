{ config, h, ... }:

{
  xdg.configFile.containers.source = h.mkXdgConfigLink config "containers/config";
}
