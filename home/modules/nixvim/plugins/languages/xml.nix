{...}: {
  # programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.c = ["clang-format"];
  programs.nixvim.plugins.lsp.servers.lemminx = {
    enable = true;
  };
}
