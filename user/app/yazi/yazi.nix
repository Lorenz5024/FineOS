{ pkgs, userSettings, config, ... }:

{
  home.packages = [
    pkgs.yazi

    # plugin to enter directories when enter is pressed,
    # instead of opening them in editor
    pkgs.yaziPlugins.smart-enter
  ];

  programs.yazi.enableZshIntegration = true;

  xdg.configFile."yazi/".source = config.lib.file.mkOutOfStoreSymlink "${userSettings.flakeDir}/user/app/yazi/yazi/";

  programs.yazi = {

    shellWrapperName = "y";

  };
}
