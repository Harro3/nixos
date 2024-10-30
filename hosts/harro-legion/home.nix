{pkgs, ...}: {
  imports = [
    ../../home-manager/modules/desktop-apps/desktop-apps.nix

    ../../home-manager/modules/kitty/kitty.nix

    ../../home-manager/modules/shell/zsh.nix
    ../../home-manager/modules/shell/tmux.nix
    ../../home-manager/modules/shell/sesh.nix

    ../../home-manager/modules/nixvim/nixvim.nix

    ../../home-manager/modules/wofi/wofi.nix

    ../../home-manager/modules/waybar/waybar.nix

    ../../home-manager/modules/hyprland/hyprland.nix
    ../../home-manager/modules/hyprland/hypridle.nix
    ../../home-manager/modules/hyprland/hyprpaper.nix
    ../../home-manager/modules/hyprland/hyprlock.nix
    ../../home-manager/modules/hyprland/mako.nix
  ];

  home.username = "harro";
  home.homeDirectory = "/home/harro";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  wallpaper = ../../home-manager/wallpapers/mountains.jpg;

  home.packages = with pkgs; [
    lazygit
    unzip
    zathura
    libreoffice
    wl-clipboard
    nh
    nerdfonts
    jq
    prettierd

    cmake
    gnumake
    gcc
    nodejs
    cargo
    rustc
    python311
    docker
    docker-compose
    jdk17
    clang-tools
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
