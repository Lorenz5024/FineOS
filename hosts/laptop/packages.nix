{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Use this file to install packages which
    # are not configured elsewhere.
    # Packages configured with nix should not be put here.

    #Development
    jetbrains.idea-ultimate

    # System
    brightnessctl			# brightness for laptop displays

  ];

}
