{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zoxide    # cd with extra features
    tlrc      # simplified man pages
    pcre16    # grep with more functionality
    bat       # better cat
    yazi				# tui file manager
  ];
}
