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

  services.v2raya = {
    enable = true;
  };
}
