{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.json.enable = lib.mkEnableOption "json language";
  };
  config = lib.mkIf config.nvim.lang.json.enable {
    programs.nixvim.plugins.lsp.servers.jsonls = {
      enable = true;
    };
  };
}
