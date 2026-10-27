{ ext, ... }:

{
  xdg.configFile."mako/config".enable = false;
  xdg.configFile.mako.source = ext.mklink "config";

  services.mako = {
    enable = false;
  };
}
