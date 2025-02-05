{
  lib,
  inputs,
  ...
}: {
  imports =
    [
      inputs.sops-nix.nixosModules.sops
    ]
    ++ lib.custom.allModules ./.;
}
