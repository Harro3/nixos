{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/harro/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;
    secrets = {
      "private_keys/harro" = {
        path = "/home/harro/.ssh/id_ed25519";
      };
    };
  };
}
