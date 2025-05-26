{ pkgs, ... }:

{
  programs.element-desktop = {
    enable = true;
    package = pkgs.element-desktop.override {
      commandLineArgs = [
        "--disable-gpu"
      ];
    };
  };
}
