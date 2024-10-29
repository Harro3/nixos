{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = ''
        Path to wallpaper
      '';
    };
  };

  config = {
    home.packages = with pkgs; [
      hyprpaper
    ];

    home.file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${config.wallpaper}
      wallpaper=,${config.wallpaper}
    '';
  };
}
