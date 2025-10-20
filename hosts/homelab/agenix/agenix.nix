{ inputs, hostSettings, ... }:

{
  environment.systemPackages = [ inputs.agenix.packages."${hostSettings.system}".default ];
  programs.ssh.startAgent = true;

  age.secrets.nextcloud-admin-pass = {
    file = ./nextcloud-admin-pass.age;
    owner = "lorenz";
  };

  age.identityPaths = [ "/root/.ssh/id_ed25519" ];
}

