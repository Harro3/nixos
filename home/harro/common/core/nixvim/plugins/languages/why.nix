{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.lang.why.enable = lib.mkEnableOption "why language";
  };

  config = lib.mkIf config.nvim.lang.why.enable {
    home.packages = with pkgs; [
      why3
      alt-ergo
    ];

    home.file.".why3.conf".text = ''
      [main]
      default_editor = "xdg-open %f"
      magic = 14
      memlimit = 1000
      running_provers_max = 2
      timelimit = 5.000000

      [partial_prover]
      name = "Coq"
      path = "/home/harro/.nix-profile/bin/coqtop"
      version = "8.20.0"

      [partial_prover]
      manual = true
      name = "Alt-Ergo"
      path = "/nix/store/1mzi8aj1mjz0k0mhsnf5by4b7qq1xk87-ocaml5.2.1-alt-ergo-2.6.0-bin/bin/alt-ergo"
      version = "2.6.0"
    '';
  };
}
