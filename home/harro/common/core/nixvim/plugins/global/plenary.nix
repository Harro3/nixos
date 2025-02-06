{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.plenary.enable = lib.mkEnableOption "plenary";
  };

  config = lib.mkIf config.nvim.plugins.plenary.enable {
    programs.nixvim = {
      extraPlugins = with pkgs.vimPlugins; [
        plenary-nvim
      ];
    };
  };
}
