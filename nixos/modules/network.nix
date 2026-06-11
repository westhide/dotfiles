{ opts, ... }:

{
  networking = {
    hostName = opts.hostname;
    hosts = {
      "23.254.193.48" = [ "h3clabs.homes" ];
    };
    networkmanager = {
      enable = true;
      insertNameservers = [
        "223.6.6.6"
        "1.1.1.1"
        "223.5.5.5"
      ];
    };
    proxy = {
      default = opts.proxyurl;
      noProxy = "127.0.0.1,localhost";
    };
    firewall = {
      trustedInterfaces = [ "tun0" ];
      allowedTCPPorts = [
        6443 # k3s
        1420
        1421
        1430
      ];
    };
  };

  programs = {
    mtr.enable = true;
    wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
    trippy.enable = true;
    sniffnet.enable = true;
  };

  services = {
    v2raya.enable = true;
    geoipupdate = {
      enable = true;
      interval = "monthly";
      settings = {
        AccountID = opts.geoipupdate.AccountID;
        LicenseKey = opts.geoipupdate.LicenseKey;
        EditionIDs = [
          "GeoLite2-ASN"
          "GeoLite2-City"
          "GeoLite2-Country"
        ];
      };
    };
  };
  # systemd.services.v2raya = {
  #   serviceConfig.Environment = [
  #     "V2RAYA_LOG_LEVEL=debug"
  #   ];
  # };
}
