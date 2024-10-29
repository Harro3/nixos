{pkgs, ...}: {
  options = {
  };

  config = {
    users.users.harro = {
      isNormalUser = true;
      description = "Harro";
      extraGroups = ["networkmanager" "wheel" "audio" "sound" "docker"];
      packages = [];
      shell = pkgs.zsh;
    };
  };
}
