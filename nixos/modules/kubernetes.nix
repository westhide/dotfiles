{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kubernetes-helm
  ];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      # "--debug"
    ];
  };
  networking.firewall = {
    allowedTCPPorts = [
      6443 # API Server
    ];
    allowedUDPPorts = [
      # 8472 # Flannel VXLAN
    ];
  };
}
