# ------------------------- #
# System Settings --------- #
# ------------------------- #

{
  system = "x86_64-linux";
  timezone = "Europe/Vienna";
  locale = "en_US.UTF-8";

  # The desktop environment configuration to use 
  desktops = [ "kde" ]; # example: [ "hyprland" "kde" ]

  # Set to true/false depending on if the host is a laptop
  isLaptop = true;
  
  # The host, used for scripts
  host = "fineos-laptop";
}
