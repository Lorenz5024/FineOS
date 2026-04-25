{ pkgs, ... }:

{
  home.packages = [
    pkgs.fine-cycle-audio
  ];

  nixpkgs.overlays = [
    (self: super: {
      fine-cycle-audio = pkgs.writeShellApplication {
        name = "fine-cycle-audio";

        text = ''
          # Get sink names (internal IDs)
          mapfile -t sinks < <(pactl list short sinks | awk '{print $2}')
          current=$(pactl get-default-sink)

          for i in "''${!sinks[@]}"; do
            if [[ "''${sinks[$i]}" == "$current" ]]; then
              next_index=$(( (i + 1) % ''${#sinks[@]} ))
              selected="''${sinks[$next_index]}"

              # Switch default sink
              pactl set-default-sink "$selected"

              # Move existing audio streams
              for input in $(pactl list short sink-inputs | awk '{print $1}'); do 
                pactl move-sink-input "$input" "$selected"
              done 

              # Get human-readable description
              description=$(pactl list sinks | awk -v sink="$selected" '
                $1 == "Name:" {found = ($2 == sink)}
                found && $1 == "Description:" {
                  $1=""; sub(/^ /, ""); print; exit
                }
              ')

              # Clean up the name a bit
              pretty=$(echo "$description" | \
                sed -e 's/ Analog Stereo//' \
                    -e 's/ Digital Stereo (HDMI)//' \
                    -e 's/ Output//' \
                    -e 's/ +/ /g')

              # Fallback if something goes wrong
              notify-send "Audio: ''${pretty:-$selected}"

              break
            fi 
          done
        '';
      };
    })
  ];
}

