{ config, pkgs, ... }:

{
  imports = [
    ./modules/firefox.nix

    ./modules/shell/zsh.nix
    ./modules/shell/tmux.nix

     ./modules/hyprland/hyprland.nix
     ./modules/hyprland/hypridle.nix
     ./modules/hyprland/hyprpaper.nix
     ./modules/hyprland/hyprlock.nix
     ./modules/hyprland/mako.nix

  ];

  home.username = "harro";
  home.homeDirectory = "/home/harro";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  wallpaper = ./wallpapers/mountains.jpg;

  
  home.packages = with pkgs;[
    slack
    discord
    spotify
    tmux
    nh
    nerdfonts
    sesh
    neovim

    waybar
    wofi
    wl-clipboard
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/hyprland.conf".source = dotfiles/hypr/hyprland.conf;
    ".config/kitty".source = dotfiles/kitty;
    ".config/waybar".source = dotfiles/waybar;
    ".config/wofi".source = dotfiles/wofi;
  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };





  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
