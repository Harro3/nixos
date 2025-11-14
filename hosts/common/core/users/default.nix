{
  lib,
  inputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.default] ++ lib.custom.allModules ./.;

  config = {
    users.mutableUsers = false;
  };
}
