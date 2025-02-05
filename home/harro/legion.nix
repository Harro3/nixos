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

  # Nixvim options
  # TODO

  # Packages
  # TODO:
  # Put some of these in modules in subdirs
  # And dev related things to some core dev
  # module with options (used by both the module
  # itself and nixvim)

  # The indended workflow is:
  # dev.lang.c.enable = true; -> tools and lsp setup
  home.packages = with pkgs; [
    # Desktop
    vlc
    libreoffice
    slack
    discord
    spotify
    wdisplays
    qemu_full
    # blender
    # quartus-prime-lite

    # Utils
    unzip
    zathura
    wl-clipboard
    nerdfonts
    fira-code-nerdfont
    fira-code-symbols
    jq

    # Workflow
    lazygit
    nh

    # Dev
    # prettierd
    cmake
    gnumake
    gcc
    # nodejs
    cargo
    rustc
    python311
    docker
    docker-compose
    # jdk17
    clang-tools
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
