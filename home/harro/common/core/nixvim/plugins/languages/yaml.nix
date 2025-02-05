{
  lib,
  config,
  ...
}: {
  options = {
    yaml.enable = lib.mkEnableOption "yaml language";
  };

  config = lib.mkIf config.yaml.enable {
    programs.nixvim.plugins.lsp.servers.yamlls = {
      enable = true;
    };
  };
}
