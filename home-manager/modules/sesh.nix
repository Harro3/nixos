{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sesh.enable = lib.mkEnableOption "sesh";
  };

  config = lib.mkIf config.sesh.enable {
    home.packages = with pkgs; [
      sesh
    ];

    home.file.".config/sesh/sesh.toml".text = ''
      [default_session]
      startup_command = 'nvim'

      [[session]]
      name='Downloads '
      path='~/Downloads'
      startup_command='ls'

      [[session]]
      name='Vim Config '
      path='~/nixos/home/modules/nixvim'

      [[session]]
      name='Nixos Config '
      path='~/nixos'

      [[session]]
      name="Home Manager Config "
      path="~/nixos/home/"

      [[session]]
      name="Harro Docs "
      path='~/Harro-docs/'
    '';
  };
}
