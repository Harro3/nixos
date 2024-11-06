{
  lib,
  config,
  ...
}: {
  options = {
    surround.enable = lib.mkEnableOption "surround";
  };

  config = lib.mkIf config.surround.enable {
    programs.nixvim = {
      plugins.vim-surround.enable = true;
    };
  };
}
