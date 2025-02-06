{
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.obsidian.enable = lib.mkEnableOption "Obsidian language";
  };
  config = lib.mkIf config.nvim.lang.obsidian.enable {
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
  };
}
