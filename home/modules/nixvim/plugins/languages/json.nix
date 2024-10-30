{
  lib,
  config,
  ...
}: {
  options = {
    json.enable = lib.mkEnableOption "json language";
  };
  config = lib.mkIf config.json.enable {
    programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.jsonls = ["prettier"];
    programs.nixvim.plugins.lsp.servers.jsonls = {
      enable = true;
    };
  };
}
