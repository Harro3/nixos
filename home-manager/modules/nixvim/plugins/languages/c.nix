{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    c.enable = lib.mkEnableOption "c language";
  };

  config = lib.mkIf config.c.enable {
    home.packages = with pkgs; [
      # clangd
    ];

    programs.nixvim.plugins.lsp.servers.clangd = {
      enable = true;
    };
  };
}
