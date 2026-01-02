{ pkgs, userSettings, ... }:

{
  environment.systemPackages = [
    
    (pkgs.writeShellScriptBin "fineos-rebuild" ''
      # Change to the directory containing your NixOS config repository
      cd ${userSettings.flakeDir} || { echo "Failed to change directory"; exit 1; }

      # Stage new and modified files
      git add .
      
      # Pull remote changes
      git pull

      # Attempt to build the system with nh
      if nh os switch; then
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
