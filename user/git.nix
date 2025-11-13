{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = userSettings.gitUsername;
        email = userSettings.email;
      }
    };
  };
}
