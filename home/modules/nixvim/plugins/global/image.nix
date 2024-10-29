{pkgs, ...}: {
  programs.nixvim = {
    plugins.image.enable = true;
    plugins.image.integrations.markdown.enabled = true;
  };
}
