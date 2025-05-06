{ ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./media.nix
    ./network.nix
    ./bluetooth.nix
    ./hyprland.nix
    ./virtualisation.nix
  ];
}
