{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Those packages are used for all personal hosts

    # Use this file to install packages which
    # are not configured elsewhere.
    # Packages configured with nix should not be put here.

    # Productivity
    gnome.gnome-calendar
    
    # Office
    libreoffice-qt
    obsidian
    speedcrunch     # calculator
    drawio

    # Internet
    firefox
    brave
    tor-browser
    discord
    protonmail-desktop
    nextcloud-client

    # Media
    mpv
    picard			# audio tagger
    yt-dlp			# cli youtube downloader
    lollypop			# music player
    jellycli			# cli jellyfin client
    feishin			# gui jellyfin client
    xfce.ristretto              # image viewer

    # Shell
    zoxide    # cd with extra features
    tlrc      # simplified man pages
    pcre16    # grep with more functionality

    #Development
    android-tools
    postman
    jdk

    # Other
    bitwarden

    # File manager
    yazi				# tui file manager
    xfce.thunar				# gui file manager
  ];
}
