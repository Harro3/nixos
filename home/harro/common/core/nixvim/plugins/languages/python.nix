{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.python.enable = lib.mkEnableOption "Python language";
  };
  config = lib.mkIf config.nvim.lang.python.enable {
    home.packages = with pkgs; [black];
    programs.nixvim.plugins.lsp.servers.pyright = {
      enable = true;
    };
  };
}
