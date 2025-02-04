{inputs, ...}: let
  secretspath = builtins.toString inputs.secrets;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.file.".ssh/id_ed25519.pub".source = ./id_ed25519.pub;

  sops = {
    age.keyFile = "/home/harro/.config/sops/age/keys.txt";

    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    secrets = {
      "private_keys/harro" = {
        path = "/home/harro/.ssh/id_ed25519";
      };
    };
  };
}
