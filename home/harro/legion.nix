{pkgs, ...}: {
  imports = [
    ./common
  ];

  # General config
  home.username = "harro";
  home.homeDirectory = "/home/harro";
  hyprpaperWallpaperPath = ./wallpapers/mountains.jpg;

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;

  # Modules
  homemodules.waybar.enable = true;
  homemodules.wofi.enable = true;
  homemodules.firefox.enable = true;
  homemodules.hypridle.enable = true;
  homemodules.hyprland.enable = true;
  homemodules.hyprlock.enable = true;
  homemodules.hyprpaper.enable = true;
  homemodules.mako.enable = true;
  homemodules.tmux.enable = true;

  homemodules.kicad.enable = false;
  homemodules.sesh.enable = false;

  # Nixvim langs
  nvim.lang = {
    bash.enable = true;
    c.enable = true;
    docker.enable = true;
    html.enable = true;
    json.enable = true;
    markdown.enable = true;
    nix.enable = true;
    obsidian.enable = true;
    python.enable = true;
    tex.enable = true;
    yaml.enable = true;
  };

  # Packages
  home.packages = with pkgs; [
    # Desktop
    vlc
    libreoffice
    slack
    discord
    wdisplays
    qemu_full
    # blender
    # quartus-prime-lite

    # Utils
    zip
    unzip
    zathura
    wl-clipboard
    jq

    # Workflow
    lazygit
    nh

    python312
    docker-compose
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
