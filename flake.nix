{
  description = "Harro's config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/Harro3/nix-secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (nixpkgs) lib;

    userDefs = ./hosts/common/core/users;

    hosts = lib.attrNames (builtins.readDir ./hosts/nixos);
    users = let
      userFiles = lib.filter (u: u != "default.nix") (lib.attrNames (builtins.readDir userDefs));
      userNames = lib.map (f: lib.replaceStrings [".nix"] [""] f) userFiles;
    in
      userNames;

    mkHost = host: let
      hostPath = ./hosts/nixos/${host};
      enabledUsers = lib.filter (user: builtins.pathExists ./home/${user}/${host}.nix) users;
    in {
      ${host} = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs outputs;
          vars = {hostname = host;};

          lib = nixpkgs.lib.extend (self: super: {custom = import ./lib {inherit (nixpkgs) lib;};});
        };

        modules = [
          hostPath
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager = {
              backupFileExtension = "bck";
              extraSpecialArgs = {inherit inputs;};
              users = lib.genAttrs enabledUsers (user: import (./home/${user}/${host}.nix));
            };
          }
        ];
      };
    };

    HostsConfigs = lib.foldl (acc: set: acc // set) {} (lib.map (host: mkHost host) hosts);
  in {
    nixosConfigurations = HostsConfigs;
  };
}
