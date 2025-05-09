# See also configuration.nix(5) man page, https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  opts,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Boot
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  # Time
  time.timeZone = "Asia/Shanghai";

  # i18n
  i18n.defaultLocale = "en_US.UTF-8";

  # Users
  users.users = {
    ${opts.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "pipewire"
        "docker"
        "kvm"
        "adbusers"
      ];
      shell = pkgs.bash;
    };
  };

  # Packages
  environment.systemPackages = with pkgs; [
    openssl
  ];

  # Programs
  programs = {
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
    openssh.enable = true;
  };

  # Graphics
  hardware.graphics = {
    enable = true;
  };

  # GC
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };

  # !!! NEVER CHANGE THIS LINE
  system.stateVersion = "24.11";
}
