{ inputs, pkgs, ... }:
{
  options = {
    
  };
   
  config = {
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

    programs.bat.catppuccin.enable = true;
    programs.fzf.catppuccin.enable = true;
    programs.yazi.catppuccin.enable = true;

    home.file.".zshrc".source = ../dotfiles/zsh/.zshrc;
    home.file.".p10k.zsh".source = ../dotfiles/zsh/.p10k.zsh;

  };
}
