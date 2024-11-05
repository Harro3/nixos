let
  selectOpts = "{behavior = cmp.SelectBehavior.Select}";
in
  {...}: {
    programs.nixvim = {
      plugins.cmp-buffer.enable = true;
      plugins.cmp-path.enable = true;
      plugins.dap.enable = true;

      plugins.conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          notify_on_error = true;
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
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
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
            "<CR>" = "cmp.mapping.confirm({select = true})";

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
                    if cmp.visible() then
                            cmp.select_next_item()
                        elseif require('luasnip').expand_or_jumpable() then
                            require('luasnip').expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" })
            '';

            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_prev_item()
                      elseif require('luasnip').jumpable(-1) then
                          require('luasnip').jump(-1)
                      else
                          fallback()
                      end
                  end, { "i", "s" })
            '';
          };
        };
      };
    };
  }
