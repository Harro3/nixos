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

    ./plugins/languages/c.nix
    ./plugins/languages/coq.nix
    ./plugins/languages/css.nix
    ./plugins/languages/docker.nix
    ./plugins/languages/html.nix
    ./plugins/languages/java.nix
    ./plugins/languages/json.nix
    ./plugins/languages/markdown.nix
    ./plugins/languages/nix.nix
    ./plugins/languages/obsidian.nix
    ./plugins/languages/python.nix
    ./plugins/languages/ts.nix
    ./plugins/languages/xml.nix
    ./plugins/languages/yaml.nix
  ];

  programs.nixvim.enable = true;

  c.enable = true;
  coq.enable = true;
  css.enable = true;
  docker.enable = true;
  html.enable = true;
  java.enable = true;
  json.enable = true;
  markdown.enable = true;
  nixLang.enable = true;
  obsidian.enable = true;
  python.enable = true;
  ts.enable = true;
  xml.enable = true;
  yaml.enable = true;
}
