{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.xml.enable = lib.mkEnableOption "xml language";
  };

  config = lib.mkIf config.nvim.lang.xml.enable {
    programs.nixvim.plugins.lsp.servers.lemminx = {
      enable = true;
    };
  };
}
