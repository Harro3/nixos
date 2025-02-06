{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.c.enable = lib.mkEnableOption "c language";
  };

  config = lib.mkIf config.nvim.lang.c.enable {
    home.packages = with pkgs; [
      # clangd
    ];

    programs.nixvim.plugins.lsp.servers.clangd = {
      enable = true;
    };
  };
}
