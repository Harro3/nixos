{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.kitty.enable = lib.mkEnableOption "Kitty terminal emulator";
  };

  config = lib.mkIf config.hostmodules.kitty.enable {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
