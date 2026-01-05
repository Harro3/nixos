{
  libharro,
  inputs,
  ...
}: {
  imports =
    [
      inputs.sops-nix.nixosModules.sops
    ]
    ++ libharro.allModules ./.;
}
