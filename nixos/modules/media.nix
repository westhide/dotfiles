{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
  ];

  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  security.rtkit.enable = true;
}
