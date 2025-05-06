{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
  ];

  security.rtkit.enable = true;

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
}
