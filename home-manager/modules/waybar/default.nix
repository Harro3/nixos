{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    waybar.enable = lib.mkEnableOption "waybar";
  };

  config = lib.mkIf config.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];

    home.file.".config/waybar/config.jsonc".source = ./dotfiles/config.jsonc;
    home.file.".config/waybar/style.css".source = ./dotfiles/style.css;
    home.file.".config/waybar/mocha.css".source = ./dotfiles/mocha.css;
  };
}
