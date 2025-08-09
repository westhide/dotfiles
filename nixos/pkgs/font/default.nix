{ lib, pkgs, ... }:

{
  home = {
    activation = {
      link-fonts = lib.hm.dag.entryAfter [ "installPackages" ] ''
        run [ ! -d ~/.local/share/fonts ] && [ -d ~/dotfiles/fonts ] && ln -s ~/dotfiles/fonts ~/.local/share/fonts
      '';
    };
    packages = with pkgs; [
      fontforge
    ];
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "CommitMonoFont" ];
      sansSerif = [ "CommitMonoFont" ];
      monospace = [ "CommitMonoFont" ];
    };
  };
}
