{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    homemodules.sesh.enable = lib.mkEnableOption "sesh";
  };

  config = lib.mkIf config.homemodules.sesh.enable {
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
      path='~/nixos/home-manager/modules/nixvim'

      [[session]]
      name='Nixos Config '
      path='~/nixos'

      [[session]]
      name="Home Manager Config "
      path="~/nixos/home-manager/"

      [[session]]
      name="Harro Docs "
      path='~/Harro-docs/'
    '';
  };
}
