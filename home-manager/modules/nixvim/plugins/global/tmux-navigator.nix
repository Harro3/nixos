{
  lib,
  config,
  ...
}: {
  options = {
    tmux-navigator.enable = lib.mkEnableOption "tmux-navigator";
  };

  config = lib.mkIf config.tmux-navigator.enable {
    programs.nixvim = {
      plugins.tmux-navigator.enable = true;
    };
  };
}
