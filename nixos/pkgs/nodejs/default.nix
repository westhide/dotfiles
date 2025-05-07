{ pkgs, ... }:

{
  # npm set prefix ~/.npm-store
  # corepack enable --install-directory ~/.corepack-store/bin
  home = {
    sessionPath = [
      "$HOME/.npm-store/bin"
      "$HOME/.corepack-store/bin"
    ];
  };

  home.packages = with pkgs; [
    nodejs
    # pnpm
    # yarn
  ];
}
