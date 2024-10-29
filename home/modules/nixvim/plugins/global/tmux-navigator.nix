{pkgs, ...}: {
  programs.nixvim = {
    plugins.tmux-navigator.enable = true;
  };
}
