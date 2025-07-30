{ userSettings, ... }:

{
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "${userSettings.browser}";
    "x-scheme-handler/https" = "${userSettings.browser}";
    "x-scheme-handler/about" = "${userSettings.browser}";
    "x-scheme-handler/unknown" = "${userSettings.browser}";
    "text/html" = "${userSettings.browser}";
  };
}
