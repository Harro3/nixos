{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.wayland.enable = lib.mkEnableOption "wayland";
  };

  config = lib.mkIf config.hostmodules.wayland.enable {
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
    environment.sessionVariables.XDG_SESSION_TYPE = "wayland";

    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      wayland
    ];
  };
}
