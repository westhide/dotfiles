{ pkgs, ext, ... }:

{
  xdg.configFile.uv.source = ext.mklink "uv-config";

  home.packages = with pkgs; [
    uv
    python3Minimal
    python3Packages.virtualenv
  ];
}
