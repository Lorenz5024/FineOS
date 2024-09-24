{ pkgs, ... }:

{
  home.packages = with pkgs; [
    yazi				# tui file manager
  ];
}
