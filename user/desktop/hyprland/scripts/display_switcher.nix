{ pkgs, ... }:

{
  home.packages = [
    pkgs.display-switcher
  ];

  nixpkgs.overlays = [
    # radio
    (self: super: {
      display-switcher = pkgs.writeShellApplication {
        name = "display-switcher";

        text = ''
          print_usage() {
            echo "Usage: $0 [dp1|hdmi]"
            echo "  dp1  - Switch to DP-1 and disable HDMI-A-1"
            echo "  hdmi - Switch to HDMI-A-1 and disable DP-1"
          }

          if [ -z "$1" ]; then 
            echo "Error: Missing argument."
            print_usage
            exit 1 
          fi

          case "$1" in 
            dp1)
              echo "Switching to DP-1..."

              hyprctl eval '
              hl.monitor({
                output = "DP-1",
                mode = "3440x1440@144",
                position = "0x0",
                scale = 1,
                vrr = 3,
                disabled = false,
              })

              hl.monitor({
                output = "HDMI-A-1",
                disabled = true,
              })
              '
              ;;
            hdmi)
              echo "Switching to HDMI-A-1..."

              hyprctl eval '
              hl.monitor({
                output = "HDMI-A-1",
                mode = "3840x2160@120",
                position = "0x0",
                scale = 1,
                vrr = 3,
                disabled = false,
              })

              hl.monitor({
                output = "DP-1",
                disabled = true,
              })
              '
              ;;
            *)
              echo "Error: Invalid argument '$1'."
              print_usage
              exit 1 
              ;;

          esac
        '';

      };
    })
  ];
}
