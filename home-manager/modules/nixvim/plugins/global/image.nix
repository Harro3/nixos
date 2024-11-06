{
  lib,
  config,
  ...
}: {
  options = {
    image.enable = lib.mkEnableOption "image";
  };

  config = lib.mkIf config.image.enable {
    programs.nixvim = {
      plugins.image.enable = true;
      plugins.image.integrations.markdown.enabled = true;
    };
  };
}
