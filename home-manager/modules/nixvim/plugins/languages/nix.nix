{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixLang.enable = lib.mkEnableOption "nix language";
  };
  config = lib.mkIf config.nixLang.enable {
    home.packages = with pkgs; [
      alejandra
    ];
    programs.nixvim.plugins.lsp.servers.nil_ls = {
      enable = true;
    };
  };
}
