{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    sql.enable = lib.mkEnableOption "sql language";
  };
  config = lib.mkIf config.sql.enable {
    home.packages = with pkgs; [
      postgresql_14
      dbeaver-bin
    ];
    programs.nixvim.plugins.lsp.servers.sqlls = {
      enable = true;
      package = null;
    };
  };
}
