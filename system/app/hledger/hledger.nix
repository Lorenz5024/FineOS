{ pkgs, userSettings, ... }:

let 
  ledgerDir = "/home/${userSettings.username}/Finance";
  ledgerBackupScript = pkgs.writeShellScript "ledger-backup.sh" ''
    set -euo pipefail

    cd ${ledgerDir}

    git add -A 

    if ! git diff --cached --quiet; then
      git commit -m "Automated backup: $(date --iso-8601=seconds)"
      git push
    else
      echo "No changes to commit."
    fi
  '';
in
{
  environment.systemPackages = [ pkgs.hledger ];

  environment.sessionVariables = {
    LEDGER_FILE = "~/Finance/2025.journal";
  };

    systemd.services.ledgerBackup = {
    description = "Backup hledger files to GitHub";
    serviceConfig = {
      Type = "oneshot";
      User = userSettings.username;
      ExecStart = ledgerBackupScript;
      Environment = "SSH_AUTH_SOCK=/run/user/1000/keyring/ssh";
    };
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };

  systemd.timers.ledgerBackup = {
    description = "Periodic backup of hledger files";
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
    wants = [ "ledgerBackup.service" ];
    unitConfig.Requires = [ "ledgerBackup.service" ];
  };



}
