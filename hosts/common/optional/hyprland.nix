{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.hyprland.enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf config.hostmodules.hyprland.enable {
    environment.systemPackages = with pkgs; [
      hyprland
    ];

    programs.hyprland.enable = true;
  };
}
