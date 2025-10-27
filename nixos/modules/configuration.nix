{ pkgs, opts, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
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
        "podman"
        "kvm"
        "adbusers"
        "wireshark"
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
    nix-ld.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Services
  services = {
    libinput.enable = true;
    openssh.enable = true;
    envfs.enable = true;
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
  system.stateVersion = "25.05";
}
