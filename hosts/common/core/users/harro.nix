{
  pkgs,
  config,
  ...
}: {
  environment.sessionVariables.NH_FLAKE = "/home/harro/nixos";
  environment.sessionVariables.HYPRSHOT_DIR = "/home/harro/Pictures/screenshots";

  # User creation with sops password
  sops.secrets.harro-password.neededForUsers = true;

  users.groups.libvirtd.members = ["harro"];

  users.users.harro = {
    isNormalUser = true;
    description = "Harro";
    hashedPasswordFile = config.sops.secrets.harro-password.path;
    extraGroups = ["networkmanager" "wheel" "audio" "sound" "docker" "dialout" "uucp" "bosco" "libvirtd"];
    packages = [];
    shell = pkgs.zsh;
  };
}
