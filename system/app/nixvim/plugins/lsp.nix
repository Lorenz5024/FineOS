{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {

      # javascript / typescript
      # tsserver.enable = true;

      # java 
      # java-language-server.enable = true; # this server does not work in current version. It is a problem of the server itself 

      # lua
      # lua-ls.enable = true;

      # rust
      rust_analyzer = {
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
}
