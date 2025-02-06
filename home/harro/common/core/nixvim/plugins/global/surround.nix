{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.surround.enable = lib.mkEnableOption "surround";
  };

  config = lib.mkIf config.nvim.plugins.surround.enable {
    programs.nixvim = {
      plugins.vim-surround.enable = true;
    };
  };
}
