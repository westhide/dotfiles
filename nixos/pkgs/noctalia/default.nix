{ config, ext, ... }:

{
  xdg.configFile."noctalia/config.toml".source = ext.mklink "config/config.toml";

  home.file.noctalia-settings = {
    target = "${config.xdg.stateHome}/noctalia/settings.toml";
    source = ext.mklink "config/state/settings.toml";
  };

  programs.noctalia = {
    enable = true;
    systemd.enable = false;
  };
}
