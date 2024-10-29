{...}: {
  programs.nixvim = {
    plugins.conform-nvim.settings.formatters_by_ft.markdown = ["prettier"];
    plugins.render-markdown.enable = true;
  };
}
