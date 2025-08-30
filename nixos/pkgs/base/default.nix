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
      tree
      lsof
      nmap
      unzip
      openssl
      binutils
      inetutils
      fastfetch
      brightnessctl
      smartmontools
    ];
  };
}
