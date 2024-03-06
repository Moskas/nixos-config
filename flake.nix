{
  description = "Moskas' flake configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";
    flake-parts.url = "github:hercules-ci/flake-parts";
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config = {
      url = "github:Moskas/nixvim-config";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixvim.follows = "nixvim";
        flake-parts.follows = "flake-parts";
      };
    }; # Add a catchy name later
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # qtile setup
    qtile-config = {
      url = "github:Moskas/qtile-config";
      flake = false;
    };

    # wallpapers
    wallpapers = {
      url = "github:Moskas/wallpapers";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, home-manager, nur, wsl, nix-colors, nixvim
    , nixvim-config, emacs-overlay, disko, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; # { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      #lib = nixpkgs.lib;
      inherit (nixpkgs) lib;
      default-overlays = {
        nixpkgs.overlays = [ emacs-overlay.overlay nur.overlay ];
      };
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
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit username e-mail nix-colors nixvim nixvim-config;
                };
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
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit username e-mail nix-colors nixvim nixvim-config nur;
                };
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
            ./hosts/cheshire
            ./hosts/cheshire/configuration.nix
            default-overlays
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit username e-mail nix-colors nixvim nixvim-config nur
                    inputs;
                };
                users.${username}.imports =
                  [ (import ./hosts/cheshire/home.nix) ];
              };
            }
            inputs.nix-gaming.nixosModules.pipewireLowLatency
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
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit username e-mail nix-colors nixvim nixvim-config nur;
                };
              };
              home-manager.users.${username}.imports =
                [ (import ./hosts/laffey/home.nix) ];
            }
          ];
        };
        glasgow = lib.nixosSystem {
          system = "i686-linux";
          specialArgs = { inherit self nixpkgs home-manager; };
          modules = [ ./hosts/glasgow/configuration.nix ];
        };
        iso = lib.nixosSystem {
          inherit system;
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            ./hosts/iso/configuration.nix
          ];
          specialArgs = { inherit self inputs username nixpkgs home-manager; };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        NIX_CONFIG =
          "extra-experimental-features = nix-command flakes repl-flake";
        packages = with pkgs; [ alejandra git sops age deadnix ];
        name = "dotfiles";
        DIRENV_LOG_FORMAT = "";
        formatter = pkgs.alejandra;
      };
    };
}
