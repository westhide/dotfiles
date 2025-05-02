{ ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      # xkb.options = "eurosign:e,caps:escape";
      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
