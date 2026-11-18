{ ext, ... }:

{
  xdg.configFile.alacritty.source = ext.mklink "config";

  programs.alacritty.enable = true;

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "Alacritty.desktop" ];
  };
}
