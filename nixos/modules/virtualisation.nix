{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    buildah
    # podman-compose
    docker-compose
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
      containersConf = {
        settings = {
          engine.compose_warning_logs = false;
          containers = {
            log_driver = "k8s-file";
            log_size_max = 524288000; # 500M
          };
        };
      };
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
