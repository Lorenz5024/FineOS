{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    rustc 
    gcc
  ];
}
