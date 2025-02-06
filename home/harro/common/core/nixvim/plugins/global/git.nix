{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.git.enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf config.nvim.plugins.git.enable {
    home.packages = with pkgs; [
      lazygit
    ];
    programs.nixvim = {
      keymaps = [
        {
          key = "<leader>lg";
          action = "<cmd>LazyGit<CR>";
          options.desc = "LazyGit";
        }
      ];

      plugins.fugitive.enable = true;
      plugins.gitsigns.enable = true;
      plugins.lazygit.enable = true;
    };
  };
}
