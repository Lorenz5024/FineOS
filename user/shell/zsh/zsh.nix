{ ... }:

{
  imports = [ 
    ./../starship/starship.nix 

    ./../extras/eza/eza.nix
    ./../extras/fzf/fzf.nix
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    plugins = [
    ];

    shellAliases = {
      c = "clear";
      v = "nvim";

      # Aliases which replace standard tool with something else 
      ls = "eza --group-directories-first";
    };

  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}
