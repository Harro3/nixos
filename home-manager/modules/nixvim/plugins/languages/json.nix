{
  lib,
  config,
  ...
}: {
  options = {
    json.enable = lib.mkEnableOption "json language";
  };
  config = lib.mkIf config.json.enable {
    programs.nixvim.plugins.lsp.servers.jsonls = {
      enable = true;
    };
  };
}
