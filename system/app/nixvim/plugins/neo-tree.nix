{ ... }:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;



    settings = {
      popup_border_style = "rounded";
      close_if_last_window = true;
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
