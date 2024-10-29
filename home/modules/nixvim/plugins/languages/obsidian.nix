{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      workspaces = [
        {
          name = "harro-docs";
          path = "~/Harro-docs";
        }
      ];
    };
  };
}
