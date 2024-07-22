{ ... }:

{
  programs.nixvim.plugins.neo-tree = {
    enable = true;

    closeIfLastWindow = true;

    popupBorderStyle = "rounded";

    window = {
      position = "float";
      popup.position = "50%";
    };

  };
}
