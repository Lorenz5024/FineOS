{ pkgs, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      rust
      bash 
      json
      make
      markdown
      hyprlang
      css
      ledger
    ];
  };
}
