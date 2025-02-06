{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.yaml.enable = lib.mkEnableOption "yaml language";
  };

  config = lib.mkIf config.nvim.lang.yaml.enable {
    programs.nixvim.plugins.lsp.servers.yamlls = {
      enable = true;
    };
  };
}
