{...}: {
  programs.nixvim = {
    plugins.cmp-treesitter.enable = true;
    plugins.treesitter = {
      enable = true;

      settings = {
        auto_install = true;
      };
    };
  };
}
