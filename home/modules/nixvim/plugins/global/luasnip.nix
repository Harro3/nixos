{pkgs, ...}: {
  programs.nixvim = {
    plugins.friendly-snippets.enable = true;
    plugins.luasnip.enable = true;
  };
}
