{
  lib,
  config,
  ...
}: {
  options = {
    which-key.enable = lib.mkEnableOption "which-key";
  };

  config = lib.mkIf config.which-key.enable {
    programs.nixvim = {
      plugins.which-key.enable = true;
    };
  };
}
