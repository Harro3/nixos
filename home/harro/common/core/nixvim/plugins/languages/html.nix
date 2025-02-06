{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.html.enable = lib.mkEnableOption "html language";
  };
  config = lib.mkIf config.nvim.lang.html.enable {
    programs.nixvim.plugins.lsp.servers.html = {
      enable = true;
    };
  };
}
