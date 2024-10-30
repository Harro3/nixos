{...}: {
  programs.nixvim = {
    plugins.floaterm = {
      enable = true;

      keymaps.toggle = "<leader>flt";
      keymaps.new = "<leader>ft";
    };
  };
}
