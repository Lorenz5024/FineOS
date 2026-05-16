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

   #      text = ''
	  # # Check if screenshot directory exists
	  # if [ ! -d ${screenshot_directory} ]
	  # then 
	  #   mkdir ${screenshot_directory}
	  # fi
			#
	  # # take screenshot
	  # grim -g "$(slurp)" ${screenshot_directory}/"$(date +'%s_grim.png')"
			#
   #        notify-send "Screenshot created at ${screenshot_directory}"
   #      '';

         text = ''
            # Check if screenshot directory exists
            if [ ! -d "${screenshot_directory}" ]; then
              mkdir -p "${screenshot_directory}"
            fi

            FILE="${screenshot_directory}/$(date +'%s_grim.png')"

            # Take screenshot
            grim -g "$(slurp)" "$FILE"

            # Copy screenshot to clipboard
            wl-copy < "$FILE"

            notify-send "Screenshot saved and copied to clipboard" "$FILE"
          '';
      };
    })
  ];
}

