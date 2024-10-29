{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules/desktop-apps/desktop-apps.nix

    ./modules/kitty/kitty.nix

    ./modules/shell/zsh.nix
    ./modules/shell/tmux.nix
    ./modules/shell/sesh.nix

    # ./modules/nvim/nvim.nix
    ./modules/nixvim/nixvim.nix

    ./modules/wofi/wofi.nix

    ./modules/waybar/waybar.nix

    ./modules/hyprland/hyprland.nix
    ./modules/hyprland/hypridle.nix
    ./modules/hyprland/hyprpaper.nix
    ./modules/hyprland/hyprlock.nix
    ./modules/hyprland/mako.nix
  ];

  home.username = "harro";
  home.homeDirectory = "/home/harro";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  wallpaper = ./wallpapers/mountains.jpg;

  home.packages = with pkgs; [
    lazygit
    unzip
    zathura
    libreoffice
    wl-clipboard
    nh
    nerdfonts
    jq

    lua
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
    # clang
    texlab
    pandoc
    texlivePackages.latexmk
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
