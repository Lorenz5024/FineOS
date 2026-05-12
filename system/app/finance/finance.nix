{ pkgs, ... }:

{
  imports = [
    ./hledger/hledger.nix
  ];

  environment.systemPackages = with pkgs; [
    ticker
  ];
}
