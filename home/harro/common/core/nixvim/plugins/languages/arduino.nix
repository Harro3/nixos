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
      arduino-language-server
      clang-tools
    ];

    programs.nixvim.plugins.lsp.servers.arduino_language_server = {
      enable = true;
      cmd = [
        "arduino-language-server"
        "-cli"
        "arduino-cli"
        "-cli-config"
        "${config.xdg.configHome}/arduino15/arduino-cli.yaml"
        "-clangd"
        "clangd"
      ];
    };
  };
}
