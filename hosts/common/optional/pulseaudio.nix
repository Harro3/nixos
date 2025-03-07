{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.pulseaudio.enable = lib.mkEnableOption "Pulseaudio config";
  };

  config = lib.mkIf config.hostmodules.pulseaudio.enable {
    environment.systemPackages = with pkgs; [
      playerctl
      pulseaudio
      pavucontrol
    ];
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = false;
    };
  };
}
