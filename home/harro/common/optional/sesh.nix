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
      path='~/nixos/home/harro/common/core/nixvim'

      [[session]]
      name='Nixos Config '
      path='~/nixos'
    '';
  };
}
