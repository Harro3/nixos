{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.floaterm.enable = lib.mkEnableOption "floaterm";
  };

  config = lib.mkIf config.nvim.plugins.floaterm.enable {
    programs.nixvim = {
      plugins.floaterm = {
        enable = true;

        settings = {
          keymaps_toggle = "<leader>flt";
          keymaps_new = "<leader>ft";
        };
      };
    };
  };
}
