{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./options/options.nix
    ./options/clipboard.nix

    ./plugins/global/neo-tree.nix
    ./plugins/global/treesitter.nix
    ./plugins/global/none-ls.nix
    ./plugins/global/cmp.nix
    ./plugins/global/luasnip.nix
    ./plugins/global/lsp.nix
    ./plugins/global/alpha.nix

    ./plugins/lsp/nix.nix
    ./plugins/lsp/c.nix
  ];

  programs.nixvim.enable = true;
}
