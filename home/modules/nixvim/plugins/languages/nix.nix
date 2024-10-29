{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
  ];
  programs.nixvim.plugins.conform-nvim.settings.formatters_by_ft.nix = ["alejandra"];
  programs.nixvim.plugins.lsp.servers.nil_ls = {
    enable = true;
  };
}
