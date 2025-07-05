{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hotspot
    perf-tools
  ];
}
