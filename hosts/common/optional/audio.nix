{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.audio.enable = lib.mkEnableOption "Audio config";
  };

  config = lib.mkIf config.hostmodules.audio.enable {
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
