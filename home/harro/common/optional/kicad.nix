{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.kicad.enable = lib.mkEnableOption "kicad";
  };

  config = lib.mkIf config.homemodules.kicad.enable {
    home.packages = with pkgs; [
      kicad
    ];
  };
}
