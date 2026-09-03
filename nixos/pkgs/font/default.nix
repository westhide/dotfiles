{ lib, ... }:

{
  home = {
    activation = {
      link-fonts = lib.hm.dag.entryAfter [ "installPackages" ] ''
        run [ ! -d ~/.local/share/fonts ] && [ -d ~/dotfiles/fonts ] && ln -s ~/dotfiles/fonts ~/.local/share/fonts
      '';
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "CommitMonoFont"
        "Noto Serif CJK SC"
      ];
      sansSerif = [
        "CommitMonoFont"
        "Noto Sans CJK SC"
      ];
      monospace = [
        "CommitMonoFont"
        "Noto Sans Mono CJK SC"
      ];
    };
  };
}
