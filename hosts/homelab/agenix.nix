{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.agenix ];
  programs.ssh.startAgent = true;
}

