{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.mako.enable = lib.mkEnableOption "mako";
  };

  config = lib.mkIf config.homemodules.mako.enable {
    home.packages = with pkgs; [
      libnotify
    ];

    services.mako.enable = true;

    catppuccin.mako.enable = true;

    services.mako.settings = {
      "mode=default" = {
        default-timeout = 5000;
      };

      "urgency=high" = {
        ignore-timeout = 1;
      };
    };
  };
}
