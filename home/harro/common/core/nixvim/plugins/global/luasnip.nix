{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.luasnip.enable = lib.mkEnableOption "luasnip";
  };

  config = lib.mkIf config.nvim.plugins.luasnip.enable {
    programs.nixvim = {
      plugins.friendly-snippets.enable = true;
      plugins.luasnip.enable = true;
    };
  };
}
