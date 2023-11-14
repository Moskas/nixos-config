{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, home-manager, nur, wsl, nix-colors, sops-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        #virtual = lib.nixosSystem {
        #  inherit system;
        #  specialArgs = { inherit inputs username; };
        #  modules = [
        #    ./hosts/ virtual
        #    ./hosts/virtual/configuration.nix
        #    home-manager.nixosModules.home-manager
        #    {
        #      home-manager.useGlobalPkgs = true;
        #      home-manager.useUserPackages = true;
        #      home-manager.extraSpecialArgs = { inherit username; };
        #      home-manager.users.${username}.imports =
        #        [ (import ./hosts/virtual/home.nix) ];
        #    }
        #  ];
        #};
        shimakaze = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/shimakaze/configuration.nix
            wsl.nixosModules.wsl
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit username e-mail nix-colors;
              };
              home-manager.users.${username}.imports =
                [ (import ./hosts/shimakaze/home.nix) ];
            }
          ];
        };
        roon = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username nix-colors; };
          modules = [
            ./hosts/roon
            ./hosts/roon/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit username e-mail nix-colors;
              };
              home-manager.users.${username}.imports =
                [ (import ./hosts/roon/home.nix) ];
            }
          ];
        };
        cheshire = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username e-mail nix-colors; };
          modules = [
            sops-nix.nixosModules.sops
            ./hosts/cheshire
            ./hosts/cheshire/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit username e-mail nix-colors;
              };
              home-manager.users.${username}.imports =
                [ (import ./hosts/cheshire/home.nix) ];
            }
          ];
        };
      };
    };
}
