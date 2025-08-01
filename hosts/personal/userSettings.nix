# ----------------------- #
# User Settings --------- #
# ----------------------- #
rec {
  username = "lorenz";
  name = "Lorenz Feiner";
  email = "lorenzfeiner@proton.me";
  flakeDir = "/home/${username}/FineOS";       # the directory where the flake and configs are stored
  wallpaperDir = "/home/${username}/Pictures/wallpapers";

  gitUsername = "Lorenz5024";

  # ---- Default Applications ---- #

  # You may need to look through the configuration to figure out if an application 
  # you want to set here is installed, and install it yourself if it isn't.
  # Stuff will break if you use something not installed or spell it incorrectly.
  # Spell it like you would when starting it from the terminal.

  # Text editor 
  editor = "nvim";

  # Web browser 
  browser = "vivaldi";

  # Terminal
  terminal = "kitty";

  # File manager
  fileManager = "thunar";

  # Music player
  musicPlayer = "feishin";

  # ---- Theming ---- #

  # Run 'nh os switch' to apply the theme after change.
  # If stylix ever implements a way to reapply colors without a rebuild, let me know.

  # Theme used throughout system, choose one from  the themes folder
  theme = "tokyo-night-dark";   

  # Change to light/dark depending on the theme you chose
  themePolarity = "dark";           

  # Choose one from the waybar/themes folder
  # Not all themes might look good with dark and light colors
  waybarStyle = "fine";         
}


