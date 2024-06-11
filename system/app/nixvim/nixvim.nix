{ ... }:

{
  imports = [
    ./keymaps.nix
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
      telescope.enable = true;
      treesitter.enable = true;
      #autoclose.enable = true;
      comment.enable = true;
      luasnip.enable = true;
      markdown-preview.enable = true;
      nix.enable = true;
      lazygit.enable = true;

      toggleterm.enable = true;

      alpha = {
        enable = true;
        theme = "dashboard";
      };

      lualine = {
	enable = true;

	sectionSeparators.left = "";
	sectionSeparators.right = "";
	componentSeparators.left = "";
	componentSeparators.right = "";
      };

      conform-nvim = {
	enable = true;

	formattersByFt = {
	  nix = [ "alejandra" ];
	  javascript = [ [ "prettierd" "prettier" ] ];
	  css = [ "stylelint" ];
	  "*" = [ "codespell" ];
	  "_" = [ "trim_whitespace" ];
	};
      };

      nvim-tree = {
	enable = true;
	renderer.indentMarkers = {
	  enable = true;
	  icons.bottom = "─";
	  icons.corner = "└";
	  icons.edge = "│";
	  icons.item = "│";
	};
      };

      bufferline = {
	enable = true;
	separatorStyle = "slant";
      };

      lsp = {
        enable = true;
        servers = {

          # javascript / typescript
          tsserver.enable = true;

	  # java 
	  java-language-server.enable = true; # this server does not work in current version. It is a problem of the server itself 

          # lua
          lua-ls.enable = true;

          # rust
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };

	  # css
	  cssls.enable = true;

	  # nix
	  nixd.enable = true;
        };
      };

      cmp = {
	enable = true;
	autoEnableSources = true;

	settings = {

	  mapping = {
	    "<C-Space>" = "cmp.mapping.complete()";
	    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
	    "<C-e>" = "cmp.mapping.close()";
	    "<C-f>" = "cmp.mapping.scroll_docs(4)";
	    "<CR>" = "cmp.mapping.confirm({ select = true })";
	    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
	    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	  };

	  snippet = {
	    expand = "function(args) require('luasnip').lsp_expand(args.body) end";
	  };

	  sources = [
	    { name = "path"; }
	    { name = "nvim_lsp"; }
	    { name = "luasnip"; }
	    { name = "buffer"; }
	  ];
	};
      };
    };
  };

}
