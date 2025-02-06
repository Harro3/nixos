{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.lualine.enable = lib.mkEnableOption "lualine";
  };

  config = lib.mkIf config.nvim.plugins.lualine.enable {
    programs.nixvim = {
      plugins.lualine.enable = true;
    };
  };
}
