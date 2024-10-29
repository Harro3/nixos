{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.nixvim = {
    plugins.render-markdown.enable = true;
  };
}
