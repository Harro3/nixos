{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.image.enable = lib.mkEnableOption "image";
  };

  config = lib.mkIf config.nvim.plugins.image.enable {
    programs.nixvim = {
      plugins.image.enable = true;
      plugins.image.settings.integrations.markdown.enabled = true;
    };
  };
}
