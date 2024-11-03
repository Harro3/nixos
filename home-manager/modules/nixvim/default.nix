{
  lib,
  config,
  ...
}: {
  options = {
    nixvim.enable = lib.mkEnableOption "nixvim";
  };
  imports = [
    ./options

    ./plugins/global

    ./plugins/languages
  ];

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim.enable = true;

    c.enable = true;
    coq.enable = true;
    css.enable = true;
    cuda.enable = true;
    docker.enable = true;
    html.enable = true;
    java.enable = true;
    json.enable = true;
    markdown.enable = true;
    nixLang.enable = true;
    obsidian.enable = true;
    python.enable = true;
    ts.enable = true;
    xml.enable = true;
    yaml.enable = true;
    bash.enable = true;
  };
}
