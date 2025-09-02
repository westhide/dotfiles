{ config, pkgs, libs, ... }:

{
  xdg.configFile."btop/btop.conf".source = libs.mkXdgConfigLink config "btop/config/btop.conf";

  home.packages = with pkgs; [
    btop-cuda
  ];
}
