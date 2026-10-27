{ ext, ... }:

{
  xdg.configFile.nvim.source = ext.mklink "config";

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    sideloadInitLua = true;
  };
}
