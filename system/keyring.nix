{  pkgs, ... }:

{
  security.pam.services.greetd = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.systemPackages = [ pkgs.kdePackages.kwallet ];
}
