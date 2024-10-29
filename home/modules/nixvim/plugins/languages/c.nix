{pkgs, lib, config,...}:
{
  home.packages = with pkgs; [
    clang-tools
  ];
  programs.nixvim.plugins.lsp.servers.clangd = {
    enable = true;
  };
}
