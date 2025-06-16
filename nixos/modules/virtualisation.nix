{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    podman-compose
  ];

  virtualisation = {
    # docker = {
    #   enable = true;
    #   daemon.settings = {
    #     data-root = "/ext/docker";
    #   };
    # };
    containers = {
      enable = true;
      storage.settings = {
        storage.graphroot = "/ext/podman";
      };
    };
    podman = {
      enable = true;
      dockerCompat = true;
      autoPrune.enable = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };
}
