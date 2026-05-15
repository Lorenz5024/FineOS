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

  dconf.settings = {
    "org/virt-manager/virt_manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  users.users.${userSettings.username}.extragroups = [ "libvirtd" ];
}
