{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    vhdl.enable = lib.mkEnableOption "vhdl language";
  };

  config = lib.mkIf config.vhdl.enable {
    programs.nixvim.plugins.lsp.servers.vhdl_ls = {
      enable = true;
    };
  };
}
