{pkgs, ...}: {
  options = {
  };

  config = {
    home.packages = with pkgs; [
      wofi
    ];

    home.file.".config/wofi/config".source = ./dotfiles/config;
    home.file.".config/wofi/style.css".source = ./dotfiles/style.css;
  };
}
