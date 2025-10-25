{ inputs, hostSettings, ... }:

{
  environment.systemPackages = [ inputs.agenix.packages."${hostSettings.system}".default ];
  programs.ssh.startAgent = true;

  age.secrets.nextcloud = {
    file = ./nextcloud.age;
    owner = "nextcloud";
    group = "nextcloud";
  };

  age.identityPaths = [ "/root/.ssh/id_ed25519" ];
}

