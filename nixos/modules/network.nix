{ opts, ... }:

{
  networking = {
    hostName = opts.hostname;
    nameservers = [ "127.0.0.53" ];
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    proxy = {
      default = opts.proxyurl;
      noProxy = "127.0.0.1,localhost";
    };
    resolvconf.enable = false;
    firewall.allowedTCPPorts = [
      853
      1420
      1421
      1430
    ];
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
    resolved = {
      enable = true;
      dnssec = "allow-downgrade";
      dnsovertls = "opportunistic";
      extraConfig = ''
        Domains=~.
        DNS=8.8.8.8
      '';
    };
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
}
