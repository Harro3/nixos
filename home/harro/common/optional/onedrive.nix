{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.onedrive.enable = lib.mkEnableOption "onedrive";
  };

  config = lib.mkIf config.homemodules.hyprpaper.enable {
    nixpkgs.overlays = [
      (self: super: {
        onedrive = super.onedrive.overrideAttrs (old: {
          version = "2.5.4";

          src = super.fetchFromGitHub {
            owner = "abraunegg";
            repo = "onedrive";
            rev = "1c78078df74cf527e089d75f78544522401cf859";
            hash = "sha256-KJ+6Yo5tod36yMihBamdzCGzVOTItN9OgUd05pAyTxc=";
          };

          patches = [];
        });
      })
    ];

    home.packages = with pkgs; [
      onedrive
    ];

    home.file.".config/onedrive/config".text = ''
      sync_business_shared_items = "true"
    '';
  };
}
