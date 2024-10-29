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
    ./plugins/global/floaterm.nix
    ./plugins/global/flash.nix
    # ./plugins/global/copilot.nix
    ./plugins/global/plenary.nix
    ./plugins/global/git.nix
    ./plugins/global/image.nix
    ./plugins/global/lualine.nix
    ./plugins/global/neogen.nix
    ./plugins/global/noice.nix

    ./plugins/languages/nix.nix
    ./plugins/languages/c.nix
    ./plugins/languages/markdown.nix
  ];

  programs.nixvim.enable = true;

  # Extra plugins (no config needed)
}
