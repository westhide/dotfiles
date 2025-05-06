{ ... }:

{
  programs.hyprland = {
    enable = true;
    # withUWSM = true;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland = {
        enable = true;
      };
    };
    defaultSession = "hyprland";
  };

  services.gnome.gnome-keyring = {
    enable = true;
  };
}
