{ inputs, pkgs, opts, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.grub2-themes.nixosModules.default
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Flakes
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  # Boot
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 10;
    };
    grub2-theme = {
      enable = true;
      theme = "vimix";
      screen = "1080p";
      footer = true;
    };
    efi.canTouchEfiVariables = true;
  };
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "vm.nr_hugepages" = 128;
  };

  # Time
  time.timeZone = "Asia/Shanghai";

  # i18n
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "zh_CN.UTF-8/UTF-8" ];

  # Users
  users.users = {
    ${opts.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "bluetooth"
        "networkmanager"
        "audio"
        "video"
        "pipewire"
        "podman"
        "kvm"
        "adbusers"
        "dialout"
        "wireshark"
      ];
      shell = pkgs.bash;
    };
  };

  # Packages
  environment.systemPackages = with pkgs; [
    openssl
    iptables
    libsecret
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
    envfs.enable = true;
    openssh.enable = true;
    libinput.enable = true;
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
