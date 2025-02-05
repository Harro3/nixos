{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin inputs.nixvim.homeManagerModules.nixvim] ++ lib.custom.allModules ./.;
}
