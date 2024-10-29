{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    
    settings.defaults = {
      mappings = {
        i = {
          "<esc>" = {
            __raw = "require('telescope.actions').close";
          };
        };
      };
    };
  };
}
