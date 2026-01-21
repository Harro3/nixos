{
  config,
  lib,
  ...
}: {
  options = {
    homemodules.firefox.enable = lib.mkEnableOption "Firefox browser";
  };

  config = lib.mkIf config.homemodules.firefox.enable {
    programs.firefox = {
      enable = true;
      languagePacks = ["fr" "en-US"];

      /*
      ---- POLICIES ----
      */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        SearchBar = "unified";

        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below

          # Proton pass
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4644816/proton_pass-1.33.2.xpi";
            installation_mode = "force_installed";
          };

          # Catppuccin
          "{8446b178-c865-4f5c-8ccc-1d7887811ae3}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-lavender-git/latest.xpi";
            installation_mode = "force_installed";
          };

          # Vimium
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };
  };
}
