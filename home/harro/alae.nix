{
  pkgs,
  pkgs_unstable,
  lib,
  ...
}: {
  imports = [
    ./common
  ];

  # General config
  home.username = "harro";
  home.homeDirectory = "/home/harro";
  hyprpaperWallpaperPath = ./wallpapers/mountains.jpg;

  nixpkgs.config.allowUnfree = true;

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
    json.enable = true;
    markdown.enable = true;
    nix.enable = true;
    obsidian.enable = true;
    python.enable = true;
    yaml.enable = true;

    tex.enable = false;
  };

  nixpkgs.overlays = [
    (self: super: {
      onedrive = super.onedrive.overrideAttrs (old: rec {
        version = "2.5.4";

        src = super.fetchFromGitHub {
          owner = "abraunegg";
          repo = "onedrive";
          rev = "1c78078df74cf527e089d75f78544522401cf859";
          hash = "sha256-KJ+6Yo5tod36yMihBamdzCGzVOTItN9OgUd05pAyTxc=";
        };

        patches = [];
      });
    })
  ];

  # Packages
  home.packages = with pkgs; [
    # Desktop
    libreoffice
    discord
    spotify
    wdisplays

    # Utils
    zip
    unzip
    zathura
    wl-clipboard
    jq

    # Workflow
    lazygit
    nh
    onedrive
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
