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
  mapfile -t sinks < <(pactl list short sinks | awk '{print $1}')
  current=$(pactl get-default-sink)

  for i in "''${!sinks[@]}"; do
    if [[ "''${sinks[$i]}" == "$current" ]]; then
      next_index=$(( (i + 1) % ''${#sinks[@]} ))
      pactl set-default-sink "''${sinks[$next_index]}"

      for input in $(pactl list short sink-inputs | awk '{print $1}'); do 
        pactl move-sink-input "$input" "''${sinks[$next_index]}"
      done 

      break
    fi 
  done
'';
      };
    })
  ];
}
