{ config, pkgs, ... }:

{
  home = {
    packages = [
      pkgs.feishu
    ];
  };
}
