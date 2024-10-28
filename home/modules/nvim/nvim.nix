{ pkgs, inputs, ...}:
{
  options = {

  };

  config = {
    home.sessionVariables = {
      EDITOR = "neovim";
    };

    home.packages = with pkgs; [
    
    ];
  };
}
