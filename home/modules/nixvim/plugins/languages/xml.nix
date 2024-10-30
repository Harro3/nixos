{
  lib,
  config,
  ...
}: {
  options = {
    xml.enable = lib.mkEnableOption "xml language";
  };

  config = lib.mkIf config.xml.enable {
    programs.nixvim.plugins.lsp.servers.lemminx = {
      enable = true;
    };
  };
}
