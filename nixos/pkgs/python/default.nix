{ config, pkgs, libs, ... }:

{
  xdg.configFile.uv.source = libs.mkXdgConfigLink config "python/uv-config";

  home.packages = with pkgs; [
    python3Full
    uv
  ];
}
