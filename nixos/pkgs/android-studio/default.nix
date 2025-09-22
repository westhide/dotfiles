{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      ANDROID_HOME = "$HOME/Android/Sdk";
    };

    packages = with pkgs; [
      kotlin
      ktlint
      android-tools
      android-studio
    ];
  };
}
