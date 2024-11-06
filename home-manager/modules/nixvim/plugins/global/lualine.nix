{
  lib,
  config,
  ...
}: {
  options = {
    lualine.enable = lib.mkEnableOption "lualine";
  };

  config = lib.mkIf config.lualine.enable {
    programs.nixvim = {
      plugins.lualine.enable = true;
    };
  };
}
