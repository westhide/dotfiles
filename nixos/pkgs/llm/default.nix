{ inputs, pkgs, ... }:

{
  imports = [ ./cli.nix ];

  home.packages = with inputs.llm-pkgs.packages.${pkgs.stdenv.hostPlatform.system}; [
    dsh
    orca
    chatgpt
    claude-desktop
  ];
}
