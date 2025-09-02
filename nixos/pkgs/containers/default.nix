{ config, pkgs, libs, ... }:

{
  xdg.configFile.containers.source = libs.mkXdgConfigLink config "containers/config";

  home.packages = with pkgs; [
    podman-desktop
  ];
}
