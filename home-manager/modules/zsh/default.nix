{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      zsh
      btop
      fastfetch
      yazi
      zoxide
      bat
      eza
      fzf
    ];

    programs.zsh.enable = true;

    catppuccin.bat.enable = true;
    catppuccin.fzf.enable = true;
    catppuccin.yazi.enable = true;
    catppuccin.btop.enable = true;

    home.file.".zshrc".source = ./dotfiles/.zshrc;
    home.file.".p10k.zsh".source = ./dotfiles/.p10k.zsh;
  };
}
