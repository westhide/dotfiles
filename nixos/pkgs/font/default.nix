{ ... }:

{
  # ln -s ~/dotfiles/fonts ~/.local/share/fonts
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "CommitMonoFont" ];
      sansSerif = [ "CommitMonoFont" ];
      monospace = [ "CommitMonoFont" ];
    };
  };
}
