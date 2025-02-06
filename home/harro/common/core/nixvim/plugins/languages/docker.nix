{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.docker.enable = lib.mkEnableOption "css language";
  };
  config = lib.mkIf config.nvim.lang.docker.enable {
    programs.nixvim.plugins.lsp.servers.dockerls.enable = true;
    programs.nixvim.plugins.lsp.servers.docker_compose_language_service.enable = true;
  };
}
