{...}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>fc";
        action = ":lua vim.lsp.buf.format<CR>";
        options = {
          desc = "Format code";
        };
      }
    ];
    plugins.none-ls = {
      enable = true;
      # inlayHints = true;

      sources.formatting = {
        stylua.enable = true;
        clang_format.enable = true;
        prettier.enable = true;
        black.enable = true;
        isort.enable = true;
      };
    };
  };
}
