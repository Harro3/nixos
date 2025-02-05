{
  lib,
  config,
  ...
}: {
  options = {
    html.enable = lib.mkEnableOption "html language";
  };
  config = lib.mkIf config.html.enable {
    programs.nixvim.plugins.lsp.servers.html = {
      enable = true;
    };
  };
}
