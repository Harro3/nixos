{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvim.lang.arduino.enable = lib.mkEnableOption "arudino language";
  };

  config = lib.mkIf config.nvim.lang.arduino.enable {
    home.packages = with pkgs; [
      arduino
      arduino-cli
    ];

    programs.nixvim.plugins.lsp.servers.arduino_language_server.enable = true;
  };
}
