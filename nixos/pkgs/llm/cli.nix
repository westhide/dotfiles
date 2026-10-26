{ pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    # grok-build
    claude-code
  ];
}
