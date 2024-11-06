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

        keymaps.toggle = "<leader>flt";
        keymaps.new = "<leader>ft";
      };
    };
  };
}
