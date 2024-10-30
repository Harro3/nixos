{...}: {
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
    ./plugins/global/tmux-navigator.nix
    ./plugins/global/surround.nix
    ./plugins/global/telescope.nix
    ./plugins/global/which-key.nix
    ./plugins/global/oil.nix
    ./plugins/global/otter.nix

    ./plugins/languages/nix.nix
    ./plugins/languages/c.nix
    ./plugins/languages/markdown.nix
    ./plugins/languages/obsidian.nix
  ];

  programs.nixvim.enable = true;

  # Extra plugins (no config needed)
}
