
let selectOpts = "{behavior = cmp.SelectBehavior.Select}";
in
{pkgs, ...}:
{

  programs.nixvim = {
    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp-buffer.enable = true;
    plugins.cmp-path.enable = true;
    plugins.cmp-treesitter.enable = true;
    plugins.dap.enable = true;

    plugins.conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          notify_on_error = true;
            formatters_by_ft = {
              css = ["prettier"];
              html = ["prettier"];
              json = ["prettier"];
              just = ["just"];
              lua = ["stylua"];
              c = ["clang-format"];
              markdown = ["prettier"];
              nix = ["alejandra"];
            };
        };
      };

    plugins.cmp = {
      enable = true;
      settings = {
        performance = {
            debounce = 150;
          };
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        formatting = {
            fields = [
              "menu"
              "abbr"
              "kind"
            ];
            format = ''
              function(entry, item)
                local menu_icon = {
                  nvim_lsp = '[LSP]',
                  luasnip = '[SNIP]',
                  buffer = '[BUF]',
                  path = '[PATH]',
                }

                item.menu = menu_icon[entry.source.name]
                return item
              end
            '';
          };
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          mapping = {
            "<Up>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<Down>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-p>" = "cmp.mapping.select_prev_item(${selectOpts})";
            "<C-n>" = "cmp.mapping.select_next_item(${selectOpts})";

            "<C-u>" = "cmp.mapping.scroll_docs(-4)";
            "<C-d>" = "cmp.mapping.scroll_docs(4)";

            "<C-e>" = "cmp.mapping.abort()";
            "<C-y>" = "cmp.mapping.confirm({select = true})";
            "<CR>" = "cmp.mapping.confirm({select = false})";

            "<C-f>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<C-b>" = ''
              cmp.mapping(
                function(fallback)
                  if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<Tab>" = ''
              cmp.mapping(
                function(fallback)
                  local col = vim.fn.col('.') - 1

                  if cmp.visible() then
                    cmp.select_next_item(select_opts)
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                end,
                { "i", "s" }
              )
            '';

            "<S-Tab>" = ''
              cmp.mapping(
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          };
      };
    };
  };
}
