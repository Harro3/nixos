{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.plugins.clipboard-image.enable = lib.mkEnableOption "clipboard-image";
  };

  config = lib.mkIf config.nvim.plugins.clipboard-image.enable {
    programs.nixvim = {
      plugins.clipboard-image = {
        enable = true;
        clipboardPackage = pkgs.wl-clipboard;
      };

      keymaps = [
        {
          key = "<leader>pi";
          mode = "n";
          action = ":PasteImg<CR>";
          options = {
            desc = "Paste Image";
            silent = true;
          };
        }
      ];
    };
  };
}
