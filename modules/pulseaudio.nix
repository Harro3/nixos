{ inputs, pkgs, ... }:
{
  options = {

  };

  config = {
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = false;
    };
  };
}
