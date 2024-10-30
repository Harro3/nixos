{...}: {
  programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.jsonls = ["prettier"];
  programs.nixvim.plugins.lsp.servers.jsonls = {
    enable = true;
  };
}
