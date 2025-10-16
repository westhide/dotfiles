{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (code-cursor.override {
      commandLineArgs = "--ozone-platform-hint=auto --ozone-platform=wayland --gtk-version=4 --enable-wayland-ime";
    })
  ];
}
