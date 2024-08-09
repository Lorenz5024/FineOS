{ pkgs, userSettings, ... }:

{
  imports = [ 
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./network-manager-applet/network-manager-applet.nix
    ./gtk/gtk.nix
    ./clipboard/clipboard.nix
    ./ags/ags.nix
  ];

  home.packages = with pkgs; [
    # desktop environment
    playerctl				# used for controlling media with keyboard
    waybar				# status bar
    rofi-wayland
    xdg-desktop-portal-hyprland     	# screensharing and other stuff
    hyprpaper                       	# wallpaper
    hypridle 			    	# idle daemon
    pavucontrol                     	# audio
    swaynotificationcenter          	# notifications
    wlogout                         	# logout menu
    networkmanagerapplet            	# network management
    libnotify                       	# send notifications
    polkit-kde-agent                	# authentication agent
    pyprland				# hyprland plugins
    kitty				# terminal emulator
    slurp                               # select region of screen for screenshots
    grim                                # grab image for screenshot
  ];

  # create home directories
  xdg.userDirs = {
    enable = true;

    documents = "/home/${userSettings.username}/Documents";
    download = "/home/${userSettings.username}/Downloads";
    music = "/home/${userSettings.username}/Music";
    pictures = "/home/${userSettings.username}/Pictures";
    videos = "/home/${userSettings.username}/Videos";
  };

}
