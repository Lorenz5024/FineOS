# This file is supposed to provide a minial set of packages which can be installed on every host
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git 
    unzip
    gnutar
    fd
    cifs-utils
    nh			# yet another nix helper
    ffmpeg
    ripgrep
    nethogs
    btop 
    zoxide
    tlrc
    bat
    pcre16    # grep with more functionality
  ];
}
