{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    koboldcpp
  ];

  services.sillytavern = {
    enable = true;
    listen = true;
  };
}
