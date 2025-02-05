{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.wofi.enable = lib.mkEnableOption "wofi";
  };

  config = lib.mkIf config.homemodules.wofi.enable {
    home.packages = with pkgs; [
      wofi
    ];

    home.file.".config/wofi/config".source = ./dotfiles/config;
    home.file.".config/wofi/style.css".source = ./dotfiles/style.css;
  };
}
