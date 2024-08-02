{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    rustc 
    rust-analyzer
    cargo
    rustfmt
    clippy
    gcc
  ];
}
