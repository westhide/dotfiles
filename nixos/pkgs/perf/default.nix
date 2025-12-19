{ pkgs, ... }:

{
  home.packages = with pkgs; [
    perf
    hotspot
    gnuplot
    valgrind
    heaptrack
    perf-tools
  ];
}
