{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.which-key.enable = lib.mkEnableOption "which-key";
  };

  config = lib.mkIf config.nvim.plugins.which-key.enable {
    programs.nixvim = {
      plugins.which-key.enable = true;
    };
  };
}
