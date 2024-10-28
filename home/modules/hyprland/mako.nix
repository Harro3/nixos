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


    services.mako.extraConfig = ''
      [mode=default]
      default-timeout=5000

      [urgency=high]
      ignore-timeout=1
    '';
  };
}
