{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.gemini.enable = lib.mkEnableOption "gemini";
  };

  config = lib.mkIf config.homemodules.gemini.enable {
    home.packages = with pkgs; [
      gemini-cli
    ];
  };
}
