{
  lib,
  config,
  ...
}: {
  options = {
    luasnip.enable = lib.mkEnableOption "luasnip";
  };

  config = lib.mkIf config.luasnip.enable {
    programs.nixvim = {
      plugins.friendly-snippets.enable = true;
      plugins.luasnip.enable = true;
    };
  };
}
