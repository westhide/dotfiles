{ ext, ... }:

{
  xdg.configFile."alacritty".source = ext.mklink "config";

  programs.alacritty = {
    enable = true;
  };
}
