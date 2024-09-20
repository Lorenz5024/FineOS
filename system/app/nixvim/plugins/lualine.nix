{ ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        section_separators.left = "";
        section_separators.right = "";
        component_separators.left = "";
        component_separators.right = "";
      };

      sections.lualine_c = [{
        name = "filename";
        path = 1;
      }];
    };

  };
}
