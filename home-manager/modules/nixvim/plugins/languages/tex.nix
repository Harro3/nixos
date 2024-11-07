{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    tex.enable = lib.mkEnableOption "tex language";
  };
  config = lib.mkIf config.markdown.enable {
    home.packages = with pkgs; [
      zathura
    ];
    programs.nixvim = {
      plugins.vimtex = {
        enable = true;
        settings = {
          view_method = "zathura_simple";
        };
      };
      plugins.lsp.servers.texlab.enable = true;
    };
  };
}
