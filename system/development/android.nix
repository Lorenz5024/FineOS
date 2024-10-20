{ userSettings, ... }:

{
  programs.adb.enable = true;
  user.users."${userSettings.userName}".extraGroups = [ "adbuser "];
}
