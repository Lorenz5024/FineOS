{ pkgs, ... }:

{
  imports = [ ./quickmarks.nix ];

  programs.qutebrowser = {
    enable = true;

  };
}
