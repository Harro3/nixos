{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.hyprlock.enable = lib.mkEnableOption "Hyprlock";
  };

  config = lib.mkIf config.hostmodules.hyprlock.enable {
    security.pam.services.hyprlock = {};

    programs.hyprlock.enable = true;
  };
}
