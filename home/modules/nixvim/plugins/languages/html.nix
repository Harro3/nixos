{...}: {
  programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.html = ["prettier"];
  programs.nixvim.plugins.lsp.servers.html = {
    enable = true;
  };
}
