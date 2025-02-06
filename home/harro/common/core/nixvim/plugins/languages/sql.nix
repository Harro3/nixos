{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.lang.sql.enable = lib.mkEnableOption "sql language";
  };
  config = lib.mkIf config.nvim.lang.sql.enable {
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
