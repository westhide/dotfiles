{ config, h, ... }:

{
  programs.google-chrome = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
    ];
  };
}
