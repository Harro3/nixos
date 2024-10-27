{ inputs, pkgs, ... }:
{
  options = {
    
  };
   
  config = {
    home.packages = with pkgs; [
      zsh
    ];

    home.file.".zshrc".source = ../dotfiles/zsh/.zshrc;
    home.file.".p10k.zsh".source = ../dotfiles/zsh/.p10k.zsh;
  };
}
