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
      

      # Window management (or however this section should be called)
      {
	key = "<leader>vs";		# Split vertically
	mode = "n";
	action = "<cmd>vsplit<CR>";
      }
      {
	key = "<leader>hs";		# Split horizontally
	mode = "n";
	action = "<cmd>split<CR>";
      }
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
	key = "<leader>c";		# Close active window
	mode = "n";
	action = "<C-w>c";
      }

      # Buffers
      {
	key = "<leader>x";		# Close active buffer
	mode = "n";
	action = "<cmd>bdelete<CR>";
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
      }

      # Lazygit
      {
        key = "<leader>g";
        mode = "n";
        action = "<cmd>LazyGit<CR>";
      }

      # LSP
      {
        key = "<leader>e";
        mode = "n";
        action = ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>";
      }
  ];
}
