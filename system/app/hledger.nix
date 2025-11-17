{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.hledger ];

  environment.variables = {
    LEDGER_FILE = "~/Finance/2025.journal";
  };
}
