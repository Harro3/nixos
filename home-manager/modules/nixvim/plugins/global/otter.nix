{
  lib,
  config,
  ...
}: let
  languages = ["c" "bash" "sh"];
in {
  options = {
    otter.enable = lib.mkEnableOption "otter";
  };

  config = lib.mkIf config.otter.enable {
    programs.nixvim = {
      plugins.otter = {
        enable = true;
      };

      keymaps = [
        {
          mode = "n";
          action = ":lua require('otter').activate(${config.lib.nixvim.toLuaObject languages}, true, true, nil)<CR>";
          key = "<leader>oa";
          options = {
            desc = "Otter Activate";
            silent = true;
          };
        }
      ];
    };
  };
}
