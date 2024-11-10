{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kicad.enable = lib.mkEnableOption "kicad";
  };

  config = lib.mkIf config.kicad.enable {
    home.packages = with pkgs; [
      kicad
    ];
  };
}
