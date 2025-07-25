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

    # Development
    postman

    # Internet
    firefox
    # brave
    vivaldi
    tor-browser
    discord
    qbittorrent
    protonvpn-gui

    # Media
    mpv
    picard			# audio tagger
    yt-dlp			# cli youtube downloader
    # lollypop			# music player
    # jellycli			# cli jellyfin client
    # feishin			# gui jellyfin client
    xfce.ristretto              # image viewer
    spot                        # gtk spotify client
    spotify

    # Shell
    zoxide    # cd with extra features
    tlrc      # simplified man pages
    bat       # better cat

    # Other
    # bitwarden
    proton-pass
    gnome-disk-utility

    # File manager
    yazi				# tui file manager
    xfce.thunar				# gui file manager
  ];
}
