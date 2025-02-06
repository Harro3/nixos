{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.telescope.enable = lib.mkEnableOption "telescope";
  };

  config = lib.mkIf config.nvim.plugins.telescope.enable {
    home.packages = with pkgs; [
      ripgrep
    ];

    programs.nixvim = {
      plugins.telescope = {
        enable = true;

        extensions.ui-select = {
          enable = true;
        };

        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Find Files";
            };
          };
          "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "Live Grep";
            };
          };
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Find Buffers";
            };
          };
        };
      };
    };
  };
}
