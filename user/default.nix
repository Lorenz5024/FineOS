{ userSettings, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    "x-scheme-handler/http" = "${userSettings.browser}.desktop";
    "x-scheme-handler/https" = "${userSettings.browser}.desktop";
    "x-scheme-handler/about" = "${userSettings.browser}.desktop";
    "x-scheme-handler/unknown" = "${userSettings.browser}.desktop";
  };
}
