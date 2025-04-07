{ ... }:

{
  programs.nixvim.plugins.csvview = {
    enable = true;

    settings = {
      view = {
        display_mode = "border";
      };
    };
  };
}
