{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules
  ];

  # Global session vars
  environment.sessionVariables = {
    FLAKE = "/home/harro/nixos";
    NIXOS_OZONE_WL = "1";
    HYPRSHOT_DIR = "/home/harro/Pictures/screenshots";
  };

  # Man pages
  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  # Modules
  catppuccin.enable = true;
  bootloader.enable = true;
  caps2esc.enable = true;
  greetd.enable = true;
  locales.enable = true;
  nvidia.enable = false;

  # Programs
  programs.hyprlock.enable = true;
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;
  programs.zsh.enable = true;

  # Services
  virtualisation.docker.enable = true;
  hardware.bluetooth.enable = true;
  services.openssh.enable = true;

  # Misc config
  catppuccin.flavor = "mocha";
  security.pam.services.hyprlock = {};

  networking.hostName = "harro-legion";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  users.users.harro = {
    isNormalUser = true;
    description = "Harro";
    extraGroups = ["networkmanager" "wheel" "audio" "sound" "docker" "dialout" "uucp"];
    packages = [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  # Main user
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "harro".imports = [
        ./home.nix
        {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
        inputs.catppuccin.homeManagerModules.catppuccin
        inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };

  # System wide packages
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

  system.stateVersion = "24.05";
}
