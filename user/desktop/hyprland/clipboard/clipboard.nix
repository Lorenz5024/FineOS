{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    wl-clip-persist
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
