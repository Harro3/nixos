{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../common
  ];

  # General config
  networking.hostName = "legion";
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Modules
  hostmodules.audio.enable = true;
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

  hostmodules.nvidia.enable = false;

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
  ];

  system.stateVersion = "24.05";
}
