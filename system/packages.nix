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
  ];
}
