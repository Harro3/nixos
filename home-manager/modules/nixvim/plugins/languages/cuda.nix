{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    cuda.enable = lib.mkEnableOption "cuda language";
  };

  config = lib.mkIf config.cuda.enable {
    home.packages = with pkgs; [
      cudatoolkit
    ];
  };
}
