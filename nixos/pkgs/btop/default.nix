{ config, pkgs, h, ... }:

{
  xdg.configFile."btop/btop.conf".source = h.mkXdgConfigLink config "btop/config/btop.conf";

  home.packages = with pkgs; [
    btop-cuda
  ];
}
