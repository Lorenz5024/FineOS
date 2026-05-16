{ pkgs, userSettings, ... }:

let 
  screenshot_directory = userSettings.screenshotDir;
in
{
  home.packages = [
    pkgs.fine-screenshot
  ];

  nixpkgs.overlays = [
    (self: super: {
      fine-screenshot = pkgs.writeShellApplication {
        name = "fine-screenshot";

        text = ''
	  # Check if screenshot directory exists
	  if [ ! -d ${screenshot_directory} ]
	  then 
	    mkdir ${screenshot_directory}
	  fi

	  # take screenshot
	  grim -g "$(slurp)" ${screenshot_directory}/"$(date +'%s_grim.png')"
	  # grim -g "$(slurp)" - | wl-copy

          notify-send "Screenshot created at ${screenshot_directory}"
        '';
      };
    })
  ];
}

