{pkgs, ...}: {
  imports = [
    ../../home-manager/modules
  ];

  # Modules
  firefox.enable = true;
  hypridle.enable = true;
  hyprland.enable = true;
  hyprlock.enable = true;
  hyprpaper.enable = true;
  mako.enable = true;
  kitty.enable = true;
  wofi.enable = true;
  waybar.enable = true;
  hyprpanel.enable = false;
  zsh.enable = true;
  sesh.enable = false;
  starship.enable = true;
  tmux.enable = true;
  nixvim.enable = true;

  kicad.enable = true;

  # Misc config
  home.username = "harro";
  home.homeDirectory = "/home/harro";
  wallpaper = ../../home-manager/wallpapers/mountains.jpg;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  # Deps
  home.packages = with pkgs; [
    # Desktop
    vlc
    libreoffice
    slack
    discord
    spotify
    wdisplays
    qemu_full
    blender
    quartus-prime-lite

    # Utils
    unzip
    zathura
    wl-clipboard
    nerdfonts
    jq

    # Workflow
    lazygit
    nh

    # Dev
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
