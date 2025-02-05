{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    coq.enable = lib.mkEnableOption "coq language";
  };

  config = lib.mkIf config.coq.enable {
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
