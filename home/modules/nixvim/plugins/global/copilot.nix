{pkgs, ...}: {
  programs.nixvim = {
    plugins.copilot-cmp.enable = true;
    # plugins.copilot-vim.enable = true;
  };
}
