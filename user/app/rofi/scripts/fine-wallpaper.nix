{ pkgs, userSettings, ... }:

{
  home.packages = [
    pkgs.fine-wallpaper
  ];

  nixpkgs.overlays = [
    (self: super: {
      fine-wallpaper = pkgs.writeShellApplication {
        name = "fine-wallpaper";

        text = ''
          # WALLPAPERS PATH
          wallDIR=${userSettings.wallpaperDir}

          # Retrieve image files
          PICS=$(find "''${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.png \))

          # Rofi command
          rofi_command="rofi -i -show -dmenu -config ${userSettings.flakeDir}/user/app/rofi/config-wallpaper.rasi -window-title Wallpaper:"

          # Sorting Wallpapers
          menu() {
            for pic_path in $PICS; do
              printf "%s\n" "$pic_path"
            done
          }

          # Choice of wallpapers
          main() {
            choice=$(menu | ''${rofi_command})

            # No choice case
            if [[ -z $choice ]]; then
              exit 0
            fi

            #picture=$(echo "$PICS" | grep "$choice")

            if [[ -f $choice ]]; then
              hyprctl hyprpaper preload "$choice"
              hyprctl hyprpaper wallpaper ",$choice"
              cp "$choice" /home/lorenz/FineOS/themes/wallpaper
            else
              echo "Image not found."
              exit 1
            fi
          }

          # Check if rofi is already running
          if pidof rofi > /dev/null; then
            pkill rofi
            exit 0
          fi

          main
        '';

      };
    })
  ];
}
