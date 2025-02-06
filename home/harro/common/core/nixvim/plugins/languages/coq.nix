{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.coq.enable = lib.mkEnableOption "coq language";
  };

  config = lib.mkIf config.nvim.lang.coq.enable {
    home.packages = with pkgs; [
      coq
      coqPackages.coq-lsp
      coqPackages.serapi
      coqPackages.coqutil
    ];

    programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
      Coqtail
    ];

    programs.nixvim.plugins.lsp.servers.coq_lsp = {
      enable = true;
      package = null;
    };
  };
}
