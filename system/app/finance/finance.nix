{ pkgs, ... }:

{
  imports = [
    ./hledger/hledger.nix
  ];

  environment.systemPackages = with pkgs; [
    python313Packages.yfinance
  ];
}
