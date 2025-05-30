{ config, pkgs, h, ... }:

{
  xdg.configFile.uv.source = h.mkXdgConfigLink config "python/uv-config";

  home.packages = with pkgs; [
    python3Full
    uv
  ];
}
