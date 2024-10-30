{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    bash.enable = lib.mkEnableOption "bash language";
  };

  config = lib.mkIf config.bash.enable {
    home.packages = with pkgs; [
      bash-language-server
      shellcheck
    ];
    programs.nixvim.plugins.lsp.servers.bashls = {
      enable = true;
    };
  };
}
