{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      ANDROID_HOME = "$HOME/Android/Sdk";
    };

    packages = with pkgs; [
      android-studio
      android-tools
    ];
  };
}
