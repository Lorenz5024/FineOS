{ ... }:

{
  programs.nixvim.keymaps = [
      # Rows to SQL-in
      {
        key = "<leader>kki";
        mode = "n";
        action = "(}k$A,vipJI(€kDA€kb) ";
      }
  ];
}



4362
5243524
2354673456
34563221



