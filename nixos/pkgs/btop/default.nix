{ config, h, ... }:

{
  xdg.configFile."btop/btop.conf".source = h.mkXdgConfigLink config "btop/config/btop.conf";

  programs.btop = {
    enable = true;
  };
}
