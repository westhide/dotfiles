{ config, libs, ... }:

{
  xdg.configFile."noctalia/config.toml".source =
    libs.mkXdgConfigLink config "noctalia/config/config.toml";

  home.file."${config.xdg.stateHome}/noctalia/settings.toml".source =
    libs.mkXdgConfigLink config "noctalia/config/state/settings.toml";

  programs.noctalia = {
    enable = true;
    systemd.enable = false;
  };
}
