{pkgs, ...}: {
  home.packages = with pkgs; [
    clang-tools
  ];

  programs.nixvim.plugins.conform-nvim.settings.fornatters_by_ft.c = ["clang-format"];
  programs.nixvim.plugins.lsp.servers.clangd = {
    enable = true;
  };
}
