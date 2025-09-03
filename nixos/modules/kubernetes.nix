{ ... }:

{
  networking.firewall.allowedTCPPorts = [
    6443 # API Server
    2379
    2380 # Etcd
  ];
  networking.firewall.allowedUDPPorts = [
    # 8472 # Flannel VXLAN
  ];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      # "--debug"
    ];
  };
}
