{pkgs, ...}: {
  home.packages = with pkgs; [
    lazygit
  ];
  programs.nixvim = {
    keymaps = [
      # {
      #   mode = "n";
      #   key = "<leader>gp";
      #   action = ":Gitsigns preview_hunk<CR>";
      #   options = {
      #     desc = "Git Preview";
      #   };
      # }
      {
        key = "<leader>lg";
        action = "<cmd>LazyGit<CR>";
        options.desc = "LazyGit";
      }
    ];

    plugins.fugitive.enable = true;
    plugins.gitsigns.enable = true;
    plugins.lazygit.enable = true;
  };
}
