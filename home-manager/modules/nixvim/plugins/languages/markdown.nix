{
  lib,
  config,
  ...
}: {
  options = {
    markdown.enable = lib.mkEnableOption "markdown language";
  };
  config = lib.mkIf config.markdown.enable {
    programs.nixvim = {
      plugins.conform-nvim.settings.formatters_by_ft.markdown = ["prettier"];
      plugins.render-markdown.enable = true;
    };
  };
}
