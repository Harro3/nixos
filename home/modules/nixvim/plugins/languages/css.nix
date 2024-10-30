{...}: {
  programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.css = ["prettier"];
  programs.nixvim.plugins.lsp.servers.cssls = {
    enable = true;
  };
}
