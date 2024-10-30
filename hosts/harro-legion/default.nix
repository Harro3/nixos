{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules
  ];

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  environment.sessionVariables = {
    FLAKE = "/home/harro/nixos";
    NIXOS_OZONE_WL = "1";
    HYPRSHOT_DIR = "/home/harro/Pictures/screenshots";
  };

  virtualisation.docker.enable = true;

  # Security for hyprlock
  security.pam.services.hyprlock = {
  };
  programs.hyprlock.enable = true;

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.bluetooth.enable = true;

  networking.hostName = "harro-legion";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  programs.zsh.enable = true;

  users.users.harro = {
    isNormalUser = true;
    description = "Harro";
    extraGroups = ["networkmanager" "wheel" "audio" "sound" "docker"];
    packages = [];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "harro".imports = [
        ./home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
        inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bluez
    playerctl
    brightnessctl
    wget
    git
    firefox
    vim
    hyprland
    kitty
    pulseaudio
    pavucontrol
  ];

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
