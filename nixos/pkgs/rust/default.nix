{ pkgs, ... }:

{
  home = {
    sessionPath = [
      "$HOME/.cargo/bin"
    ];

    packages = with pkgs; [
      rustup
    ];
  };
}
