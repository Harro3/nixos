{ inputs, pkgs, ...}:
{
  options = {

  };

  config = {
    users.users.harro = {
      isNormalUser = true;
      description = "Harro";
      extraGroups = [ "networkmanager" "wheel" "audio" "sound" ];
      packages = with pkgs; [];
      shell = pkgs.zsh;
    };
  };
}
