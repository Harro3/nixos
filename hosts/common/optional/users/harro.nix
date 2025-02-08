{
  pkgs,
  config,
  lib,
  inputs,
  vars,
  ...
}: {
  options = {
    hostmodules.users.harro.enable = lib.mkEnableOption "Enable user harro on host";
  };

  config = lib.mkIf config.hostmodules.users.harro.enable {
    environment.sessionVariables.FLAKE = "/home/harro/nixos";
    environment.sessionVariables.HYPRSHOT_DIR = "/home/harro/Pictures/screenshots";

    # User creation with sops password
    sops.secrets.harro-password.neededForUsers = true;

    users.users.harro = {
      isNormalUser = true;
      description = "Harro";
      hashedPasswordFile = config.sops.secrets.harro-password.path;
      extraGroups = ["networkmanager" "wheel" "audio" "sound" "docker" "dialout" "uucp"];
      packages = [];
      shell = pkgs.zsh;
    };

    # Home manager user config
    home-manager = {
      backupFileExtension = "bck";
      extraSpecialArgs = {inherit inputs;};
      users = {
        harro.imports = [
          ../../../../home/harro/${vars.hostname}.nix
        ];
      };
    };
  };
}
