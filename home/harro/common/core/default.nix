{
  libharro,
  inputs,
  ...
}: {
  imports = [inputs.catppuccin.homeModules.catppuccin inputs.nixvim.homeManagerModules.nixvim] ++ libharro.allModules ./.;
}
