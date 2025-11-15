{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
    ];

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      cache32Bit = true;
      hinting.autohint = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
          "Noto Color Emoji"
          "Symbols Nerd Font"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
          "Noto Color Emoji"
          "Symbols Nerd Font"
        ];
        monospace = [
          "Noto Mono"
          "Noto Sans Mono CJK SC"
          "Noto Color Emoji"
          "Symbols Nerd Font Mono"
        ];
      };
    };
  };
}
