{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.vhdl.enable = lib.mkEnableOption "vhdl language";
  };

  config = lib.mkIf config.nvim.lang.vhdl.enable {
    programs.nixvim.plugins.lsp.servers.vhdl_ls = {
      enable = true;
    };
  };
}
