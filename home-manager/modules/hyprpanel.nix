{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprpanel.enable = lib.mkEnableOption "hyprpanel";
  };

  config = lib.mkIf config.hyprpanel.enable {
    home.packages = with pkgs; [
      hyprpanel
    ];
  };
}
