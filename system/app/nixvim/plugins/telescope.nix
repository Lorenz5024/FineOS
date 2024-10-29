{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>fa" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
    };
    
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
