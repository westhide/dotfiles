{ config, libs, ... }:

{
  xdg.configFile.nvim.source = libs.mkXdgConfigLink config "neovim/config";

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };
}
