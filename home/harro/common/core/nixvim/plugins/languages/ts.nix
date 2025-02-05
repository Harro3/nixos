{
  lib,
  config,
  ...
}: {
  options = {
    ts.enable = lib.mkEnableOption "typescript language";
  };
  config = lib.mkIf config.ts.enable {
    programs.nixvim.plugins.none-ls.sources.formatting.prettier.disableTsServerFormatter = true;
    programs.nixvim.plugins.lsp.servers.ts_ls = {
      enable = true;

      #   settings = {
      #     callback = {
      #       __raw = ''
      #               function()
      #               require'lspconfig'.ts_ls.setup{
      #           init_options = {
      #             plugins = {
      #               {
      #                 name = "@vue/typescript-plugin",
      #                 location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
      #                 languages = {"javascript", "typescript", "vue"},
      #               },
      #             },
      #           },
      #           filetypes = {
      #             "javascript",
      #             "typescript",
      #             "vue",
      #           },
      #         }
      #         end
      #       '';
      #     };
      #   };
    };
  };
}
