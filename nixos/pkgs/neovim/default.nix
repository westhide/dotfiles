{ config, h, ... }:

{
  xdg.configFile.nvim.source = h.mkXdgConfigLink config "neovim/config";

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };
}
