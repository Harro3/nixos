{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.virtualisation.enable = lib.mkEnableOption "Virt manager config";
  };

  config = lib.mkIf config.hostmodules.virtualisation.enable {
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
