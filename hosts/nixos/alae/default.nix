{
  pkgs,
  vars,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../common
  ];

  # General config
  networking.hostName = vars.hostname;
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Modules
  hostmodules.pipewire.enable = true;
  hostmodules.bluetooth.enable = true;
  hostmodules.caps2esc.enable = true;
  hostmodules.catppuccin.enable = true;
  hostmodules.greetd.enable = true;
  hostmodules.grub.enable = true;
  hostmodules.hyprland.enable = true;
  hostmodules.hyprlock.enable = true;
  hostmodules.hyprshot.enable = true;
  hostmodules.kitty.enable = true;
  hostmodules.zsh.enable = true;
  hostmodules.wayland.enable = true;

  # Users
  hostmodules.users.harro.enable = true;

  # Services
  virtualisation.docker.enable = true;
  services.openssh.enable = true;

  # Additionnal packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    wget
    git
    firefox
    vim
    gparted
    spotify

    influxdb2
  ];

  networking.hosts = {
    "127.0.0.1" = ["bosco-mosquitto"];
  };
  networking.firewall.allowedTCPPorts = [8086];

  system.stateVersion = "24.05";
}
