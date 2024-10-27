{ inputs, pkgs, ...}:
{
  options = {

  };

  config = {
    home.packages = with pkgs; [
      libnotify
    ];

    services.mako.enable = true;
    services.mako.catppuccin.enable = true;
  };
}
