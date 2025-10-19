{ inputs, ... }:

{
  environment.systemPackages = [ inputs.agenix.nixosModules.default ];
  programs.ssh.startAgent = true;
}

