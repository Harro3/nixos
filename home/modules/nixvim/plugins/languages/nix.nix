{pkgs, lib, config,...}:
{
  options = {
    # enable = lib.mkEnableOption "nix lsp";
  };

  config = {# lib.mkIf config.nix.enable {
    home.packages = with pkgs; [
      alejandra
    ];
    programs.nixvim.plugins.lsp.servers.nil_ls = {
      enable = true;
    };
  };
}
