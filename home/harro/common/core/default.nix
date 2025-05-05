{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.catppuccin.homeModules.catppuccin inputs.nixvim.homeManagerModules.nixvim] ++ lib.custom.allModules ./.;
}
