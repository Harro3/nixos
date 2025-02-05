{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hostmodules.greetd.enable = lib.mkEnableOption "Greetd";
  };

  config = lib.mkIf config.hostmodules.greetd.enable {
    services.greetd = {
      enable = true;
      vt = 7;
      settings = rec {
        initial_session = {
          command = ''${pkgs.greetd.tuigreet}/bin/tuigreet --remember --remember-session --asterisks --time'';
          user = "harro";
        };
        default_session = initial_session;
      };
    };
  };
}
