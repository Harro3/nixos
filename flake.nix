{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.harro-legion = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/harro-legion
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.default
        inputs.sops-nix.nixosModules.sops
      ];
    };

    nixosConfigurations.q-batt-reload = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArg = {inherit inputs;};
      modules = [
        ./hosts/q-batt-reload
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.default
        inputs.sops-nix.nixosModules.sops
      ];
    };
  };
}
