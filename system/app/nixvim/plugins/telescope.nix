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
          "<C-q>" = {
            __raw = "function(buf) require('telescope.actions').smart_send_to_qflist(buf); vim.cmd('cfirst') end";
          };
        };
        n = {
          "<C-q>" = {
            __raw = "function(buf) require('telescope.actions').smart_send_to_qflist(buf); vim.cmd('cfirst') end";
          };
        };
      };
    };
  };
}
