{ ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        data-root = "/ext/docker";
      };
    };
  };
}
