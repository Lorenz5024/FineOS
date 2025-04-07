{ ... }:

{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    settings.formattersByFt = {
      nix = [ "alejandra" ];
      javascript = [ [ "prettierd" "prettier" ] ];
      css = [ "stylelint" ];
      "*" = [ "codespell" ];
      "_" = [ "trim_whitespace" ];
    };
  };
}
