{
  lib,
  config,
  ...
}: {
  options = {
    autopairs.enable = lib.mkEnableOption "autopairs";
  };
  config = lib.mkIf config.autopairs.enable {
    programs.nixvim.plugins.nvim-autopairs = {
      enable = true;
    };
  };
}
