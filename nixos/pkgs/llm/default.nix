{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    grok-build
    claude-code
    inputs.llm-pkgs.packages.${stdenv.hostPlatform.system}.dsh
    inputs.llm-pkgs.packages.${stdenv.hostPlatform.system}.chatgpt
    inputs.llm-pkgs.packages.${stdenv.hostPlatform.system}.claude-desktop
  ];
}
