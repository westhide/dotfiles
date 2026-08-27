{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
    ];

    fontDir.enable = true;
    enableDefaultPackages = false;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      cache32Bit = true;
      hinting.autohint = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [
          "Noto Serif CJK SC"
          "Noto Serif"
          "Noto Color Emoji"
          "Symbols Nerd Font"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Noto Sans"
          "Noto Color Emoji"
          "Symbols Nerd Font"
        ];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Noto Mono"
          "Noto Color Emoji"
          "Symbols Nerd Font Mono"
        ];
      };
      aliases = {
        "system-ui" = {
          prefer = [
            "Noto Sans CJK SC"
            "Noto Sans"
            "Noto Color Emoji"
            "Symbols Nerd Font"
          ];
        };
      };
    };
  };
}
