{
  lib,
  config,
  ...
}: {
  options = {
    hostmodules.appimage.enable = lib.mkEnableOption "appimage";
  };

  config = lib.mkIf config.hostmodules.appimage.enable {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
