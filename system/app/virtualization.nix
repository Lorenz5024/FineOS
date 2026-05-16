{ pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
  ];

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ userSettings.username ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
}
