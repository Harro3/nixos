{ pkgs, inputs, config, ...}:
{
  options = {

  };


  config = {
    home.sessionVariables = {
      EDITOR = "neovim";
      
      
      # OPAMROOT = "${config.home.homeDirectory}/.opam";
      # LUA_PATH = pkgs.luajitPackages.magick + "/share/lua/5.1/?.lua;" + "/share/lua/5.1/?/init.lua;";
      #  LUA_CPATH = pkgs.luajitPackages.magick + "/lib/lua/5.1/?.so;";
    };


    home.file.".config/nvim".source = ./dotfiles;


    home.packages = with pkgs; [
      neovim

      coqPackages.coq-lsp
      tree-sitter
      python312Packages.pynvim
      python312Packages.pylatexenc
      texliveMedium
      ripgrep
      black
      prettierd
      stylua
      isort
      ltex-ls
      markdownlint-cli
      marksman
      imagemagick
      shellcheck
      vue-language-server
    ];
  };
}
