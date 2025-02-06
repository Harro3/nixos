{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.oil.enable = lib.mkEnableOption "oil";
  };

  config = lib.mkIf config.nvim.plugins.oil.enable {
    programs.nixvim = {
      keymaps = [
        {
          mode = "n";
          key = "-";
          action = ":lua require('oil').open()<CR>";
          options = {
            desc = "Open parent directory";
            silent = true;
          };
        }
      ];
      plugins.oil = {
        enable = true;
      };
    };
  };
}
