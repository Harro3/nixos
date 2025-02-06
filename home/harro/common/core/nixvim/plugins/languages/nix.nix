{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.nix.enable = lib.mkEnableOption "nix language";
  };
  config = lib.mkIf config.nvim.lang.nix.enable {
    home.packages = with pkgs; [
      alejandra
    ];
    programs.nixvim.plugins.lsp.servers.nil_ls = {
      enable = true;
    };
  };
}
