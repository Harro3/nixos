{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.hyprshot.enable = lib.mkEnableOption "Hyprshot";
  };

  config =
    lib.mkIf config.hostmodules.hyprshot.enable {
    };
}
