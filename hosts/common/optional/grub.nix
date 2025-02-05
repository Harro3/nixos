{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.grub.enable = lib.mkEnableOption "Grub";
  };

  config = lib.mkIf config.hostmodules.grub.enable {
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.useOSProber = true;

    catppuccin.grub.enable = true;
  };
}
