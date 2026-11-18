{ ext, ... }:

{
  xdg.configFile.nvim.source = ext.mklink "config";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;
  };
}
