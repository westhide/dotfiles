{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hotspot
    valgrind
    heaptrack
    perf-tools
  ];
}
