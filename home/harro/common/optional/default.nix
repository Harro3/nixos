{
  pkgs,
  lib,
  ...
}: {
  imports = lib.custom.allModules ./.;
}
