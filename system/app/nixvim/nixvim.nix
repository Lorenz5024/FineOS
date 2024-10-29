{ ... }:

{
  imports = [
    ./keymaps.nix

    ./plugins/telescope.nix
    ./plugins/cmp.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/alpha.nix
    ./plugins/conform-nvim.nix
    ./plugins/barbecue.nix
    ./plugins/toggleterm.nix
    ./plugins/neo-tree.nix
    ./plugins/which-key.nix
    ./plugins/obsidian.nix
  ];

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;		# Show line numbers
      relativenumber = true;	# Show relative line numbers

      shiftwidth = 2;		# Tab width should be 2

      scrolloff = 10;		# number of lines to keep visible at top and bottom

      ignorecase = true;	# ignore case in search
    };
    
    plugins = {
      # Here only plugins without any extra config are declared.  
      # All other plugins are in their own file inside the plugins folder.

      treesitter.enable = true;
      comment.enable = true;
      luasnip.enable = true;
      markdown-preview.enable = true;
      nix.enable = true;
      lazygit.enable = true;
      auto-save.enable = true;
      autoclose.enable = true;
      web-devicons.enable = true;
    };
  };

}
