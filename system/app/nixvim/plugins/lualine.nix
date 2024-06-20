{ ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;

    sectionSeparators.left = "";
    sectionSeparators.right = "";
    componentSeparators.left = "";
    componentSeparators.right = "";

    sections.lualine_c = [{
      name = "filename";
      extraConfig = {
        path = 1;
      };
    }];
  };
}
