# ------------------------- #
# Host Settings --------- #
# ------------------------- #

{
  system = "x86_64-linux";
  timezone = "Europe/Vienna";
  locale = "en_US.UTF-8";

  # The desktop environments to install. The first one is auto selected during login
  desktops = [ "cosmic" "kde" ]; # example: [ "hyprland" "kde" ]

  # Set to true/false depending on if the host is a laptop
  isLaptop = false;

  # Name of config from flake used for this host. Used for scripts
  config = "fineos";
}
