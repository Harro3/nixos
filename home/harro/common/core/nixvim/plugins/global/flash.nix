{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.flash.enable = lib.mkEnableOption "flash";
  };

  config = lib.mkIf config.nvim.plugins.flash.enable {
    programs.nixvim = {
      keymaps = [
        {
          mode = "n";
          key = "<leader>s";
          action = '':lua require("flash").jump()<CR>'';
        }
      ];
      plugins.flash = {
        enable = true;
      };
    };
  };
}
