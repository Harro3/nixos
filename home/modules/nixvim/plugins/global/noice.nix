{pkgs, ...}: {
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
}
