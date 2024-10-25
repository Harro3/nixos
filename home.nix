{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "harro";
  home.homeDirectory = "/home/harro";

  wayland.windowManager.hyprland.xwayland.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.bat.catppuccin.enable = true;
  programs.fzf.catppuccin.enable = true;
  programs.yazi.catppuccin.enable = true;
  
  services.dunst.catppuccin.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    yazi
    nerdfonts
    sesh
    zoxide
    bat
    eza
    fzf
    tmux
    neovim

    waybar
    wofi
    hyprpaper
    dunst
    wl-clipboard
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = dotfiles/zsh/.zshrc;
    ".p10k.zsh".source = dotfiles/zsh/.p10k.zsh;
    "Pictures/wallpapers".source = dotfiles/wallpapers;

    ".config/dunst".source = dotfiles/dunst;
    ".config/hypr".source = dotfiles/hypr;
    ".config/kitty".source = dotfiles/kitty;
    ".config/waybar".source = dotfiles/waybar;
    ".config/wofi".source = dotfiles/wofi;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/harro/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
