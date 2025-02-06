{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.tmux-navigator.enable = lib.mkEnableOption "tmux-navigator";
  };

  config = lib.mkIf config.nvim.plugins.tmux-navigator.enable {
    programs.nixvim = {
      plugins.tmux-navigator.enable = true;
    };
  };
}
