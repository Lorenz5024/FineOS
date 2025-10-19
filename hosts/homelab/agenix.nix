{ inputs, hostSettings, ... }:

{
  environment.systemPackages = [ inputs.agenix.packages."${hostSettings.system}".default ];
  programs.ssh.startAgent = true;
}

