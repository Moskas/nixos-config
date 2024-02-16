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
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, nur, wsl, nix-colors, sops-nix
    , nixvim, emacs-overlay, disko, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      lib = nixpkgs.lib;
      default-overlays = { nixpkgs.overlays = [ emacs-overlay.overlay ]; };
    in {
      nixosConfigurations = {
        shimakaze = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/shimakaze/configuration.nix
            default-overlays
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
            default-overlays
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
            default-overlays
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
        laffey = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs username nix-colors; };
          modules = [
            disko.nixosModules.default
            ./hosts/laffey
            ./hosts/laffey/configuration.nix
            default-overlays
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
