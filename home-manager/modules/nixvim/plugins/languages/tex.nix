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
      texlive.combined.scheme-full
    ];
    programs.nixvim = {
      plugins.vimtex = {
        enable = true;
        settings = {
          view_method = "zathura_simple";
        };
        texlivePackage = pkgs.texlive.combined.scheme-full;
      };

      plugins.lsp.servers.texlab.enable = true;
    };
  };
}
