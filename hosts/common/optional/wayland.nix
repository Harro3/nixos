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

    programs.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
      wayland
    ];
  };
}
