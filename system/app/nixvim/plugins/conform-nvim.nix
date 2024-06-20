{ ... }:

{
  programs.nixvim.plugins.conform = {
    enable = true;

    formattersByFt = {
      nix = [ "alejandra" ];
      javascript = [ [ "prettierd" "prettier" ] ];
      css = [ "stylelint" ];
      "*" = [ "codespell" ];
      "_" = [ "trim_whitespace" ];
    };
  };
}
