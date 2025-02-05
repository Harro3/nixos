{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  options = {
    hostmodules.catppuccin.enable = lib.mkEnableOption "Catppuccin";
  };

  config = lib.mkIf config.hostmodules.catppuccin.enable {
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
  };
}
