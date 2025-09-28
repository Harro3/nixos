{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.nvidia.enable = lib.mkEnableOption "Nvidia drivers";
  };

  config = lib.mkIf config.hostmodules.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.modesetting.enable = true;
  };
}
