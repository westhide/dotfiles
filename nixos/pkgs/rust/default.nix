{ config, pkgs, h, ... }:

{
  xdg.configFile.sccache.source = h.mkXdgConfigLink config "rust/sccache";

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
