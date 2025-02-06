{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.treesitter.enable = lib.mkEnableOption "treesitter";
  };

  config = lib.mkIf config.nvim.plugins.treesitter.enable {
    programs.nixvim = {
      plugins.treesitter = {
        enable = true;

        settings = {
          auto_install = true;
          highlight.enable = true;

          indent.enable = true;

          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<C-space>";
              node_incremental = "<C-space>";
              scope_incremental = false;
              node_decremental = "<bs>";
            };
          };
        };
      };
    };
  };
}
