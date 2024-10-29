{
  inputs,
  pkgs,
  ...
}: {
  options = {
  };

  config = {
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
