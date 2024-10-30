{
  lib,
  config,
  ...
}: {
  options = {
    bootloader.enable = lib.mkEnableOption "bootloader";
  };

  config = lib.mkIf config.bootloader.enable {
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.useOSProber = true;
    boot.loader.grub.catppuccin.enable = true;
  };
}
