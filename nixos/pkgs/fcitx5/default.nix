{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      # GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-rime
      rime-data
    ];
  };
}
