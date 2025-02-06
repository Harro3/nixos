{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.css.enable = lib.mkEnableOption "css language";
  };
  config = lib.mkIf config.nvim.lang.css.enable {
    programs.nixvim.plugins.lsp.servers.cssls = {
      enable = true;
    };
  };
}
