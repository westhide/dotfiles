{ config, libs, ... }:

{
  xdg.configFile."alacritty".source = libs.mkXdgConfigLink config "alacritty/config";

  programs.alacritty = {
    enable = true;
  };
}
