{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    v2raya
  ];

  systemd.services.v2raya = {
    description = "v2rayA service";
    wants = [ "network-online.target" ];
    after = [ "network-online.target" "nss-lookup.target" ];
    wantedBy = [ "multi-user.target" ];

    path = with pkgs; [
      iptables
      nftables
      iproute2
      bash
      coreutils
    ];

    serviceConfig = {
      Type = "simple";
      User = "root";
      StateDirectory = "v2raya";
      ExecStart = "${lib.getExe pkgs.v2raya} --config=/var/lib/v2raya --address=127.0.0.1:2017 --log-disable-timestamp";
      Restart = "on-failure";
      RestartSec = 5;
      LimitNPROC = 500;
      LimitNOFILE = 1000000;
    };
  };
}
