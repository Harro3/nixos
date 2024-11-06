{
  lib,
  config,
  ...
}: {
  options = {
    treesitter.enable = lib.mkEnableOption "treesitter";
  };

  config = lib.mkIf config.treesitter.enable {
    programs.nixvim = {
      plugins.treesitter = {
        enable = true;

        settings = {
          auto_install = true;
          highlight.enable = true;
        };
      };
    };
  };
}
