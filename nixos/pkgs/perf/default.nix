{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hotspot
    gnuplot
    valgrind
    heaptrack
    perf-tools
    linuxKernel.packages.linux_6_12.perf
  ];
}
