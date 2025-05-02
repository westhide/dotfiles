{ ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./sound.nix
    ./network.nix
    ./bluetooth.nix
    ./hyprland.nix
  ];
}
