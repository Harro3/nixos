{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.lang.rust.enable = lib.mkEnableOption "rust language";
  };

  config = lib.mkIf config.nvim.lang.rust.enable {
    home.packages = with pkgs; [
      rustc
      cargo
      rustfmt
    ];

    programs.nixvim.plugins.rustaceanvim = {
      enable = true;
      settings.server = {
        on_attach = ''
          function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ async = false })
                end,
              })
            end
          end
        '';
      };
    };
  };
}
