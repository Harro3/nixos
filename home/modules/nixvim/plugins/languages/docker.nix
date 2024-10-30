{
  lib,
  config,
  ...
}: {
  options = {
    docker.enable = lib.mkEnableOption "css language";
  };
  config = lib.mkIf config.docker.enable {
    programs.nixvim.plugins.lsp.servers.dockerls.enable = true;
    programs.nixvim.plugins.lsp.servers.docker_compose_language_service.enable = true;
  };
}
