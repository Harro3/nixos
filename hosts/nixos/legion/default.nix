{
  pkgs,
  vars,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-legion-16arh7h-hybrid

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
  hostmodules.virtualisation.enable = true;
  hostmodules.appimage.enable = true;

  hostmodules.nvidia.enable = false;
  hostmodules.gaming.enable = false;

  # User management
  users.groups.bosco = {};

  # Extra NVIDIA option (host dependant)
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    nvidiaBusId = "PCI:01:00:0";
    amdgpuBusId = "PCI:34:00:0";
  };

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
  ];

  networking.hosts = {
    "127.0.0.1" = ["bosco-mosquitto"];
  };
  networking.firewall.allowedTCPPorts = [8086 1883];

  system.stateVersion = "24.05";
}
