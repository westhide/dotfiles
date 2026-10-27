{ ext, ... }:

{
  xdg.configFile.wofi.source = ext.mklink "config";

  programs.wofi = {
    enable = true;
  };
}
