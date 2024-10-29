{ inputs, pkgs, ...}:
{
  imports = [
    ./options/options.nix
    ./options/clipboard.nix
  ];

  programs.nixvim.enable = true;
}
