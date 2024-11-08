{
  lib,
  config,
  ...
}: {
  options = {
    sql.enable = lib.mkEnableOption "sql language";
  };
  config = lib.mkIf config.sql.enable {
    programs.nixvim.plugins.lsp.servers.sqlls = {
      enable = true;
      package = null;
    };
  };
}
