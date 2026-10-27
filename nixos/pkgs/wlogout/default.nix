{ ext, ... }:

{
  xdg.configFile.wlogout.source = ext.mklink "config";

  programs.wlogout = {
    enable = true;
  };
}
