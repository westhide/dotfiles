{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
    packages = with pkgs; [
      jq
      zip
      file
      wget
      tree
      lsof
      nmap
      unzip
      openssl
      inetutils
      fastfetch
      pkg-config
      brightnessctl
      smartmontools
    ];
  };
}
