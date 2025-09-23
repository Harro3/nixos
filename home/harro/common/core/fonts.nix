{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.inconsolata
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.ubuntu
    nerd-fonts."m+"
    nerd-fonts.symbols-only

    nerdfix
  ];
  fonts.fontconfig.enable = true;
}
