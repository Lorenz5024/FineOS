{ ... }:

{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };

      notes_subdir = "notes";
      new_notes_location = "notes_subdir";
      workspaces = [
        {
          name = "pathfinder";
          path = "~/Obsidian/pathfinder";
        }
        {
          name = "university";
          path = "~/Obsidian/university";
        }
      ];
    };

  };
}
