{ ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./media.nix
    ./network.nix
    ./bluetooth.nix
    ./font.nix
    ./hyprland.nix
    ./virtualisation.nix
  ];
}
