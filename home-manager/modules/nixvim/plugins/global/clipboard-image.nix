{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    clipboard-image.enable = lib.mkEnableOption "clipboard-image";
  };

  config = lib.mkIf config.clipboard-image.enable {
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
