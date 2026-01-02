{ pkgs,  userSettings, ... }:

{
  environment.systemPackages = [

    (pkgs.writeShellScriptBin "fineos-update" ''
      # Change to the directory containing your NixOS config repository
      cd ~/.fine/FineOS || { echo "Failed to change directory"; exit 1; }

      # Pull remote changes
      git pull

      # Attempt to build the system with nh
      if nix flake update; then
          echo "Build successful. Committing changes..."

          # Commit and push the changes
          git commit -m "Auto commit during rebuild"
          git push

          echo "Changes pushed to repository."
      else
          echo "Build failed. Please fix the issues before committing."
          exit 1
      fi
    '')
  ];
}

