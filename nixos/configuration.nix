# See also configuration.nix(5) man page, https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, username, hostname, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
  ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # Boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    proxy = {
      # default = "http://user:pass@host:port/";
      noProxy = "127.0.0.1,localhost";
    };
  };

  # Time zone.
  time.timeZone = "Asia/Shanghai";

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true;
  # };

  # Sound
  hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Touchpad

  # User account
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  # System packages
  environment.systemPackages = with pkgs; [
  ];

  # Programs
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };
  };

  # Services
  services = {
    libinput.enable = true;
    xserver.xkb.layout = "us";

    openssh.enable = true;

    # X11
    # xserver.enable = true;
    # xserver.xkb.options = "eurosign:e,caps:escape";
  };

  # Firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;


  # !!! EVER change this value
  system.stateVersion = "24.11";
}
