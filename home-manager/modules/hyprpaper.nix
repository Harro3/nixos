{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprpaper.enable = lib.mkEnableOption "hyprpaper";
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = ''
        Path to wallpaper
      '';
    };
  };

  config = lib.mkIf config.hyprpaper.enable {
    home.packages = with pkgs; [
      hyprpaper
    ];

    home.file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${config.wallpaper}
      wallpaper=,${config.wallpaper}
    '';
  };
}
