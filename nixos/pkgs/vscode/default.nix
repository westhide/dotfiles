{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        "--gtk-version=4"
        "--enable-wayland-ime"
        # "--password-store=gnome"
      ];
    };
  };
}
