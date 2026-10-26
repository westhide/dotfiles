{ config, pkgs, libs, ... }:

{
  xdg.configFile.sccache.source = libs.mkXdgConfigLink config "rust/sccache";

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  home.packages = with pkgs; [
    # jetbrains.rust-rover
    # (rustup.overrideAttrs (_: {
    #   # use nix-ld, fix dynamic-linker set-interpreter path
    #   patches = [ ];
    # }))
  ];

}

# RUSTUP_DIST_SERVER=https://cloudfront-static.rust-lang.org
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
