{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.lang.bash.enable = lib.mkEnableOption "bash language";
  };

  config = lib.mkIf config.nvim.lang.bash.enable {
    home.packages = with pkgs; [
      bash-language-server
      shellcheck
    ];
    programs.nixvim.plugins.lsp.servers.bashls = {
      enable = true;
    };
  };
}
