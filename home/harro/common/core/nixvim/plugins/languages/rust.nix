{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nvim.lang.rust.enable = lib.mkEnableOption "rust language";
  };

  config = lib.mkIf config.nvim.lang.rust.enable {
    home.packages = with pkgs; [
      rustc
      cargo
    ];

    programs.nixvim.plugins.rustaceanvim.enable = true;
  };
}
