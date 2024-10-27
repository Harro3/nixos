{ inputs, pkgs, ...}:
{
  options = {

  };

  config = {
    wayland.windowManager.hyprland.xwayland.enable = true;
    wayland.windowManager.hyprland.catppuccin.enable = true;
  };
}
