{ pkgs, ... }:

{
  xdg.terminal-exec = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    # withUWSM = true;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili";
      extraPackages = with pkgs; [
        libsForQt5.qt5.qtgraphicaleffects
      ];
    };
  };
}
