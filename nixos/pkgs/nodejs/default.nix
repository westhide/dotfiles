{ lib, pkgs, ... }:

{
  home = {
    sessionPath = [
      "$HOME/.npm-store/bin"
      "$HOME/.corepack-store/bin"
    ];
    activation = {
      init-corepack-store = lib.hm.dag.entryAfter [ "installPackages" ] ''
        run ${pkgs.nodejs}/bin/npm set prefix ~/.npm-store
        run mkdir -p ~/.corepack-store/bin
        run ${pkgs.nodejs}/bin/corepack enable --install-directory ~/.corepack-store/bin
      '';
    };
  };

  home.packages = with pkgs; [
    nodejs
    bun
    deno
    turbo
    maestro
    binaryen
  ];
}
