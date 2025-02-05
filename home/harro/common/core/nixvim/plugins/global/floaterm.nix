{
  lib,
  config,
  ...
}: {
  options = {
    floaterm.enable = lib.mkEnableOption "floaterm";
  };

  config = lib.mkIf config.floaterm.enable {
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
