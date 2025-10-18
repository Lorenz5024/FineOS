{ ... }:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;

    closeIfLastWindow = true;

    popupBorderStyle = "rounded";

    settings = {
      window = {
        position = "float";
        popup.position = "50%";

        mappings = {
          h = "close_node";
          l = "toggle_node";
        };
      };
    };

  };
}
