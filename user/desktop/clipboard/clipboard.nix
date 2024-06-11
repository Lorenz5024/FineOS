{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard-rs
    cliphist
    wl-clip-persist
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
