{ pkgs, ... }:

{
  home.packages = [
    pkgs.fine-radio
  ];

  nixpkgs.overlays = [
    (self: super: {
      fine-radio = pkgs.writeShellApplication {
        name = "fine-radio";

        text = ''
          # add more args here according to preference
          ARGS="--volume=60"

          notification(){
          # change the icon to whatever you want. Make sure your notification server 
          # supports it and already configured.

          # Now it will receive argument so the user can rename the radio title
          # to whatever they want

                  notify-send "Playing now: " "$@" --icon=media-tape
          }

          menu(){
                  printf "1. Lofi Girl\n"
                  printf "2. Soundportal\n"
          }

          main() {
                  choice=$(menu | rofi -dmenu -p "Music" | cut -d. -f1)

                  case $choice in
                          1)
                                  notification "Lofi Girl";
                      URL="https://play.streamafrica.net/lofiradio"
                                  ;;
                          2)
                                  notification "Soundportal";
                      URL="https://radioosterreich24.at/radios-soundportal-267"
                                  ;;
                  esac
              # run mpv with args and selected url
              # added title arg to make sure the pkill command kills only this instance of mpv
              mpv $ARGS --title="radio-mpv" "$URL"
          }

          # Check if rofi is already running
          if pidof rofi > /dev/null; then
            pkill rofi
            exit 0
          fi

          pkill -f radio-mpv || main
        '';

      };
    })
  ];
}
