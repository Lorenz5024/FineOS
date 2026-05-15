{ pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
  ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ userSettings.username ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
