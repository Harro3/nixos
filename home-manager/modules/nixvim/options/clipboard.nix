_: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>y";
        action = ''"+y'';
        options = {
          desc = "Yank into \" register";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>y";
        action = ''"+y'';
        options = {
          desc = "Yank into \" register";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = ''"+Y'';
        options = {
          desc = "Yank into \" register";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>p";
        action = ''"+p'';
        options = {
          desc = "Paste \" register";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>p";
        action = ''"+p'';
        options = {
          desc = "Paste \" register";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>P";
        action = ''"+P'';
        options = {
          desc = "Paste \" register";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>d";
        action = ''"_d'';
        options = {
          desc = "Delete into \" register";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>d";
        action = ''"_d'';
        options = {
          desc = "Delete into \" register";
          silent = true;
        };
      }
    ];
  };
}
