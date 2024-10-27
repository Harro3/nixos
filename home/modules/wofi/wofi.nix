{ inputs, pkgs, ... }:
{
  options = {

  };

  config = {
    home.packages = with pkgs; [
      wofi
    ];

    home.file.".config/wofi/bin/launcher".source = ./dotfiles/bin/launcher;
    home.file.".config/wofi/bin/runner".source = ./dotfiles/bin/runner;
    home.file.".config/wofi/bin/wofiemoji".source = ./dotfiles/bin/wofiemoji;

    home.file.".config/wofi/config".source = ./dotfiles/config;
    home.file.".config/wofi/style.css".source = ./dotfiles/style.css;
    home.file.".config/wofi/wofiemoji.sh".source = ./dotfiles/wofiemoji.sh;
  };
}
