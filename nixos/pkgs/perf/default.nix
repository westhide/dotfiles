{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hotspot
    gnuplot
    valgrind
    heaptrack
    perf-tools
  ];
}
