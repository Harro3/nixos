{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    python.enable = lib.mkEnableOption "Python language";
  };
  config = lib.mkIf config.python.enable {
    home.packages = with pkgs; [black];
    programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.python = ["black"];
    programs.nixvim.plugins.lsp.servers.pylsp = {
      enable = true;
    };
  };
}