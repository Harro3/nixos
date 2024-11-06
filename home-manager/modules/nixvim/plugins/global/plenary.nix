{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    plenary.enable = lib.mkEnableOption "plenary";
  };

  config = lib.mkIf config.plenary.enable {
    programs.nixvim = {
      extraPlugins = with pkgs.vimPlugins; [
        plenary-nvim
      ];
    };
  };
}
