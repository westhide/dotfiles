{ config, ... }:

{
  home.packages = [
    config.targets.genericLinux.gpu.setupPackage
  ];
}
