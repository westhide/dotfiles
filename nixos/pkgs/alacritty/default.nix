{ config, h, ... }:

{
  xdg.configFile."alacritty".source = h.mkXdgConfigLink config "alacritty/config";

  programs.alacritty = {
    enable = true;
  };
}
