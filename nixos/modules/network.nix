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

  services.v2raya = {
    enable = true;
  };
}
