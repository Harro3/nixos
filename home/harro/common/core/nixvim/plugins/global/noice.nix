{
  lib,
  config,
  ...
}: {
  options = {
    nvim.plugins.noice.enable = lib.mkEnableOption "noice";
  };

  config = lib.mkIf config.nvim.plugins.noice.enable {
    programs.nixvim = {
      plugins.noice = {
        enable = true;

        settings = {
          routes = [
            {
              filter = {
                event = "notify";
                find = "No information available";
              };
              opts = {skip = true;};
            }
          ];
          presets = {
            lsp_doc_border = true;
          };
        };
      };
    };
  };
}
