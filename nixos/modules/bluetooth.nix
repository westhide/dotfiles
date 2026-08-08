{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  services.blueman = {
    enable = true;
  };
}
