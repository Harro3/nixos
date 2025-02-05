{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.file.".ssh/id_ed25519.pub".source = ./id_ed25519.pub;

  sops.secrets = {
    "private_keys/harro" = {
      path = "/home/harro/.ssh/id_ed25519";
    };
  };
}
