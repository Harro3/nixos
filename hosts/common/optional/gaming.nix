{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hostmodules.gaming.enable = lib.mkEnableOption "Gaming";
  };

  config = lib.mkIf config.hostmodules.gaming.enable {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
