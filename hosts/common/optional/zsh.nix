{
  config,
  lib,
  ...
}: {
  options = {
    hostmodules.zsh.enable = lib.mkEnableOption "Z shell";
  };

  config = lib.mkIf config.hostmodules.zsh.enable {
    programs.zsh.enable = true;
  };
}
