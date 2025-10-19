{ inputs, hostSettings, ... }:

{
  environment.systemPackages = [ inputs.agenix.packages."${hostSettings.system}".default ];
  programs.ssh.startAgent = true;

  age.secrets.nextcloud-admin-pass = {
    file = ./nextcloud-admin-pass.age;
    owner = "nextcloud";
  };
}

