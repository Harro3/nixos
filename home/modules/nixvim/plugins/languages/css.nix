{
  lib,
  config,
  ...
}: {
  options = {
    css.enable = lib.mkEnableOption "css language";
  };
  config = lib.mkIf config.css.enable {
    programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.css = ["prettier"];
    programs.nixvim.plugins.lsp.servers.cssls = {
      enable = true;
    };
  };
}
