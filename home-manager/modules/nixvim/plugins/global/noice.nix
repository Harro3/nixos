{
  lib,
  config,
  ...
}: {
  options = {
    noice.enable = lib.mkEnableOption "noice";
  };

  config = lib.mkIf config.noice.enable {
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
