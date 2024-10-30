{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    java.enable = lib.mkEnableOption "java language";
  };
  config = lib.mkIf config.java.enable {
    home.packages = with pkgs; [jdk17 jdt-language-server];

    programs.nixvim.plugins.lsp.servers.jdtls = {
      enable = true;
      cmd = [
        "jdtls"
        "-configuration"
        "${config.home.homeDirectory}/.cache/jdtls/config"
        "-data"
        "${config.home.homeDirectory}/.cache/jdtls/workspace"
        "--jvm-arg=-javaagent:${config.home.homeDirectory}/.local/share/nvim/mason/share/jdtls/lombok.jar"
      ];
    };
  };
}
