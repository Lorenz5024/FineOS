{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" ];

    userSettings = {
      hour_format = "hour24";
      auto_update = false;
      vim_mode = true;
    };
  };
}
