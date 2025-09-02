{ config, pkgs, h, ... }:

{
  xdg.configFile.containers.source = h.mkXdgConfigLink config "containers/config";

  home.packages = with pkgs; [
    podman-desktop
  ];
}
