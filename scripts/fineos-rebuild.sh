#!/usr/bin/env sh

# Change to the directory containing your NixOS config repository
cd ~/FineOS/ || { echo "Failed to change directory"; exit 1; }

# Stage new and modified files
git add .

# Check for staged changes

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
