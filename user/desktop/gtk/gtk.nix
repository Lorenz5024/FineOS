{ pkgs, userSettings, ... }:

{
  gtk = {
    enable = true;

    iconTheme.name = "Tela";
    iconTheme.package = pkgs.tela-icon-theme;

    gtk3.bookmarks = [
      "file:///home/${userSettings.username}/Downloads"
      "file:///home/${userSettings.username}/Documents"
      "file:///home/${userSettings.username}/Pictures"
      "file:///home/${userSettings.username}/Music"
      "file:///home/${userSettings.username}/Videos"
    ] ++ (
      if userSettings.useNextcloud 
      then ["davs://${userSettings.nextcloudURL}/remote.php/dav/files/${userSettings.nextcloudUsername} Nextcloud"]
      else []
    );
  };

}
