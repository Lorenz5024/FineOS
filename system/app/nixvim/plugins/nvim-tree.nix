{ ... }:

{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;

    updateFocusedFile.enable = true;

    renderer.indentMarkers = {
      enable = true;
      icons.bottom = "─";
      icons.corner = "└";
      icons.edge = "│";
      icons.item = "│";
    };

    view.float = {
      enable = true;
      openWinConfig = {
        relative = "editor";
      };
    };
  };
}
