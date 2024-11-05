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
      clang-tools
    ];

    programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.c = ["clang-format"];
    programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.cpp = ["clang-format"];
    programs.nixvim.plugins.lsp.servers.clangd = {
      enable = true;
    };
  };
}
