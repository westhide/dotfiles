{ pkgs, ... }:

{
  home.packages = with pkgs; [
    claude-code
    codex
    mistral-rs
  ];
}
