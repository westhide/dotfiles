{ config, h, ... }:

{
  xdg.configFile.nvim.source = h.mkXdgConfigLink config "nvim";

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };
}
