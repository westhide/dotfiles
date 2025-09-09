{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
    packages = with pkgs; [
      jq
      icu
      zip
      file
      wget
      bind
      tree
      lsof
      nmap
      unzip
      openssl
      patchelf
      #binutils
      inetutils
      fastfetch
      brightnessctl
      smartmontools
    ];
  };
}
