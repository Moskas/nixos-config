{
  description = "Moskas' flake configs";

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
    nixvim = {
      url =
        "github:nix-community/nixvim?rev=1d8e7906c9606c956c6b40d8d088c8d2110dc0c0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, nur, wsl, nix-colors, sops-nix
    , nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
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
                inherit username e-mail nix-colors nixvim;
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
                inherit username e-mail nix-colors nixvim;
              };
              home-manager.users.${username}.imports =
                [ (import ./hosts/cheshire/home.nix) ];
            }
          ];
        };
        glasgow = lib.nixosSystem {
          system = "i686-linux";
          specialArgs = { inherit self nixpkgs home-manager; };
          modules = [ ./hosts/glasgow/configuration.nix ];
        };
      };
    };
}
