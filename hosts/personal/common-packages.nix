{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Those packages are used for all personal hosts

    # Use this file to install packages which
    # are not configured elsewhere.
    # Packages configured with nix should not be put here.

    # Productivity
    gnome-calendar
    
    # Office
    libreoffice-qt
    obsidian
    speedcrunch     # calculator
    evince

    # Internet
    firefox
    vivaldi
    tor-browser
    qbittorrent
    nextcloud-client

    # Media
    mpv
    picard			# audio tagger
    yt-dlp			# cli youtube downloader
    ristretto              # image viewer
    spotify

    # Shell
    zoxide    # cd with extra features
    tlrc      # simplified man pages
    bat       # better cat

    # Other
    proton-pass
    gnome-disk-utility

    # File manager
    yazi				# tui file manager
    thunar				# gui file manager

    maptool
  ];
}
