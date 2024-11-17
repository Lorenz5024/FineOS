{ ... }:

{
  programs.nixvim.keymaps = [
      # Movement
      {
	key = "<C-d>";
	mode = "n";
	action = "<C-d>zz";
      }
      {
	key = "<C-u>";
	mode = "n";
	action = "<C-u>zz";
      }

      # CTRL-commands
      {
        key = "<C-a>";
        mode = "n";
        action = "gg<S-v>G";
        options.desc = "select all";
      }

      # Window management (or however this section should be called)
      {
	key = "<C-h>";			# Move to window left, down, up, right
	mode = "n";
	action = "<C-w>h";
      }
      {
	key = "<C-j>";			
	mode = "n";
	action = "<C-w>j";
      }
      {
	key = "<C-k>";			
	mode = "n";
	action = "<C-w>k";
      }
      {
	key = "<C-l>";			
	mode = "n";
	action = "<C-w>l";
      }
      {
	key = "<leader>wc";		# Close active window
	mode = "n";
	action = "<C-w>c";
        options.desc = "close active window";
      }

      # Telescope
      {
        key = "<leader>ff";
        mode = "n";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "find files";
      }
      {
        key = "<leader>ft";
        mode = "n";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "find text";
      }
      {
        key = "<leader>fb";
        mode = "n";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "find buffers";
      }
      {
        key = "<leader>fm";
        mode = "n";
        action = "<cmd>Telescope marks<CR>";
        options.desc = "find files";
      }

      # Buffers
      {
	key = "<leader>bc";		# Close active buffer
	mode = "n";
	action = "<cmd>bdelete<CR>";
        options.desc = "close current buffer";
      }
      {
        key = "<tab>";                  # Jump between last 2 active buffers
        mode = "n";
        action = "<cmd>b#<CR>";
      }

      # For moving in insert mode
      {
	key = "<C-h>";			# Move cursor left, down, up, right
	action = "<Left>";
	mode = "i";
      }
      {
	key = "<C-j>";
	action = "<C-o>gj";
	mode = "i";
      }
      {
	key = "<C-k>";
	action = "<C-o>gk";
	mode = "i";
      }
      {
	key = "<C-l>";
	action = "<Right>";
	mode = "i";
      }
      {
	key = "<C-e>";
	action = "<End>";
	mode = "i";
      }
      {
	key = "<C-a>";
	action = "<ESC>^i";
	mode = "i";
      }

      # neo-tree 
      {
	key = "<leader>t";		# Toggle tree 
	mode = "n";
	action = "<cmd>Neotree reveal=true<CR>";
        options.desc = "toggle filetree";
      }

      # Lazygit
      {
        key = "<leader>g";
        mode = "n";
        action = "<cmd>LazyGit<CR>";
        options.desc = "open lazygit";
      }

      # LSP
      {
        key = "<leader>e";
        mode = "n";
        action = ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>";
        options.desc = "show lsp error message";
      }

      # Obsidian
      {
        key = "<leader>olff";
        mode = "n";
        action = "<cmd>ObsidianFollowLink<CR>";
        options.desc = "follow obsidian link";
      }
      {
        key = "<leader>olfh";
        mode = "n";
        action = "<cmd>ObsidianFollowLink hsplit<CR>";
        options.desc = "open obsidian link horizontally";
      }
      {
        key = "<leader>olfv";
        mode = "n";
        action = "<cmd>ObsidianFollowLink vsplit<CR>";
        options.desc = "follow obsidian link vertically";
      }
      {
        key = "<leader>oln";
        mode = "n";
        action = "<cmd>ObsidianLinkNew<CR>";
        options.desc = "link new note to selection";
      }
      {
        key = "<leader>off";
        mode = "n";
        action = "<cmd>ObsidianQuickSwitch<CR>";
        options.desc = "search for obsidian note";
      }
      {
        key = "<leader>oc";
        mode = "n";
        action = "<cmd>ObsidianToggleCheckbox<CR>";
        options.desc = "toggle checkbox";
      }
  ];
}
