{ opts, ... }:

{
  networking = {
    hostName = opts.hostname;
    networkmanager.enable = true;
    proxy = {
      default = opts.proxyurl;
      noProxy = "127.0.0.1,localhost";
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
}
