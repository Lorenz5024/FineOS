{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>o" = "buffers";
    };
    
    defaults = {
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
