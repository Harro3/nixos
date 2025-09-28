{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.gaming.enable = lib.mkEnableOption "Gaming";
  };

  config = lib.mkIf config.homemodules.gaming.enable {
    home.packages = with pkgs; [
      protonup
      lutris
      bottles
    ];

    home.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytoold.d";
    };
  };
}
