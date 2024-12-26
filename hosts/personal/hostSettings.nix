# ------------------------- #
# Host Settings --------- #
# ------------------------- #

{
  system = "x86_64-linux";
  timezone = "Europe/Vienna";
  locale = "en_US.UTF-8";

  # The desktop environment configuration to use 
  desktop = "gnome";

  # Set to true/false depending on if the host is a laptop
  isLaptop = false;

  # Name of config from flake used for this host. Used for scripts
  config = "fineos";
}
