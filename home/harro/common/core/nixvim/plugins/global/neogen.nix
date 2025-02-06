{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.neogen.enable = lib.mkEnableOption "neogen";
  };

  config = lib.mkIf config.nvim.plugins.neogen.enable {
    programs.nixvim = {
      keymaps = [
        {
          mode = "n";
          key = "<leader>mc";
          action = ":lua require('neogen').generate()<CR>";
          options = {
            desc = "Make Comment";
            silent = true;
            noremap = true;
          };
        }
      ];
      plugins.neogen.enable = true;
    };
  };
}
