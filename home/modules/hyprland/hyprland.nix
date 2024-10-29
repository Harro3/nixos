{
  inputs,
  pkgs,
  ...
}: {
  options = {
  };

  config = {
    home.packages = with pkgs; [
      hyprshot
    ];

    wayland.windowManager.hyprland.xwayland.enable = true;
    wayland.windowManager.hyprland.catppuccin.enable = true;

    home.file.".config/hypr/scripts/volume.sh".source = ./scripts/volume.sh;
    home.file.".config/hypr/scripts/brightness.sh".source = ./scripts/brightness.sh;

    home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
  };
}
