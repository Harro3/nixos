{ inputs, pkgs, ...}:
{
  options = {

  };

  config = {
    home.packages = with pkgs; [
      sesh
    ];

    home.file.".config/sesh/sesh.toml".source = ./dotfiles/sesh.toml;
  };
}
