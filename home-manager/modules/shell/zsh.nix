{pkgs, ...}: {
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

    programs.zsh.enable = true;
    programs.bat.catppuccin.enable = true;
    programs.fzf.catppuccin.enable = true;
    programs.yazi.catppuccin.enable = true;
    programs.btop.catppuccin.enable = true;

    home.file.".zshrc".source = ./dotfiles/.zshrc;
    home.file.".p10k.zsh".source = ./dotfiles/.p10k.zsh;
  };
}
