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
      winetricks
      bottles
      vkd3d-proton
      vulkan-tools
      wineWowPackages.full
    ];

    home.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytoold.d";
      VKD3D_CONFIG = "${pkgs.vkd3d-proton}/lib";
      VK_LAYER_PATH = "${pkgs.mesa}/share/vulkan/explicit_layer.d";
    };
  };
}
