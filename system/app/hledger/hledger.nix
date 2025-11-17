{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.hledger ];

  environment.sessionVariables = {
    LEDGER_FILE = "~/Finance/2025.journal";
  };

}
