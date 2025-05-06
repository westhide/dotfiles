{ ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./audio.nix
    ./network.nix
    ./bluetooth.nix
    ./hyprland.nix
  ];
}
