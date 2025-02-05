{
  lib,
  inputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.default] ++ lib.custom.allModules ./.;

  users.mutableUsers = false;
}
