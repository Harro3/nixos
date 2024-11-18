{
  lib,
  config,
  ...
}: {
  options = {
    nixvim.enable = lib.mkEnableOption "nixvim";
  };
  imports = [
    ./options

    ./plugins/global

    ./plugins/languages
  ];

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim.enable = true;

    general-opts.enable = true;
    clipboard.enable = true;

    alpha.enable = true;
    autopairs.enable = true;
    clipboard-image.enable = true;
    cmp.enable = true;
    flash.enable = true;
    floaterm.enable = true;
    git.enable = true;
    image.enable = true;
    lsp.enable = true;
    lualine.enable = true;
    luasnip.enable = true;
    neo-tree.enable = true;
    neogen.enable = true;
    noice.enable = true;
    none-ls.enable = true;
    oil.enable = true;
    otter.enable = true;
    plenary.enable = true;
    surround.enable = true;
    telescope.enable = true;
    tmux-navigator.enable = true;
    treesitter.enable = true;
    which-key.enable = true;

    c.enable = true;
    coq.enable = true;
    css.enable = true;
    cuda.enable = true;
    docker.enable = true;
    html.enable = true;
    java.enable = true;
    json.enable = true;
    markdown.enable = true;
    nixLang.enable = true;
    obsidian.enable = true;
    python.enable = true;
    sql.enable = true;
    tex.enable = true;
    ts.enable = true;
    xml.enable = true;
    yaml.enable = true;
    bash.enable = true;
  };
}
