{ config, pkgs, libs, ... }:

{
  xdg.configFile.sccache.source = libs.mkXdgConfigLink config "rust/sccache";

  home = {
    sessionPath = [
      "$HOME/.cargo/bin"
    ];

    packages = with pkgs; [
      rustup
      sccache
    ];
  };
}
