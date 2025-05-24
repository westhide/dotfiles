{ opts, ... }:

{
  networking = {
    hostName = opts.hostname;
    networkmanager.enable = true;
    proxy = {
      default = opts.proxyurl;
      noProxy = "127.0.0.1,localhost";
    };
    # firewall = {
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    # };
  };

  programs = {
    mtr.enable = true;
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
