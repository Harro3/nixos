{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.markdown.enable = lib.mkEnableOption "markdown language";
  };
  config = lib.mkIf config.nvim.lang.markdown.enable {
    programs.nixvim = {
      plugins.render-markdown.enable = true;
      plugins.markdown-preview.enable = true;

      plugins.lsp.servers.marksman.enable = true;
    };
  };
}
