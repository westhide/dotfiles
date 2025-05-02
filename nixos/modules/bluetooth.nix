{ config, lib, pkgs, opts, ... }:

{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
  ];

  hardware.bluetooth = {
    enable = true;
  };
}
