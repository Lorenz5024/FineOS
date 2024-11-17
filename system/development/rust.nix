
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup 
    rustc
    cargo 
    rustfmt 
    gcc
    clippy
    diesel-cli
    libiconv
  ];
}
