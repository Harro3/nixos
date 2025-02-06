{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.autopairs.enable = lib.mkEnableOption "autopairs";
  };
  config = lib.mkIf config.nvim.plugins.autopairs.enable {
    programs.nixvim.plugins.nvim-autopairs = {
      enable = true;
    };
  };
}
