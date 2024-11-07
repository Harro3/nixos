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
      plugins.render-markdown.enable = true;

      plugins.lsp.servers.marksman.enable = true;
    };
  };
}
