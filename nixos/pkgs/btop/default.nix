{ config, h, ... }:

{
  xdg.configFile."btop/btop.conf".source = h.mkXdgConfigLink config "btop/btop.conf";

  programs.btop = {
    enable = true;
  };
}
