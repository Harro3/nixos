{
  lib,
  config,
  ...
}: {
  options = {
    obsidian.enable = lib.mkEnableOption "Obsidian language";
  };
  config = lib.mkIf config.obsidian.enable {
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
