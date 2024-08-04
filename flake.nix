{
  description = "Moskas' flake configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable-nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";
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
    #nixvim-config = {
    #  url = "github:Moskas/nixvim-config";
    #  inputs = {
    #    nixpkgs.follows = "nixpkgs";
    #    nixvim.follows = "nixvim";
    #    flake-parts.follows = "flake-parts";
    #  };
    #};
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nix-on-droid = {
    #  url = "github:nix-community/nix-on-droid/testing";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  inputs.home-manager.follows = "home-manager";
    #};
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    # qtile setup
    qtile-config = {
      url = "github:Moskas/qtile-config";
      flake = false;
    };

    anifetch.url = "github:Moskas/anifetch";
    mpdnotify.url = "github:Moskas/mpd-notify-rs";

    nyaa = {
      url = "github:Beastwick18/nyaa";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wallpapers
    #wallpapers = {
    #  url = "github:Moskas/wallpapers";
    #  flake = false;
    #};
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      wsl,
      nix-colors,
      nixvim,
      #nixvim-config,
      emacs-overlay,
      disko,
      nixpkgs-f2k,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      inherit (nixpkgs) lib;
      default-overlays = {
        nixpkgs.overlays = [
          emacs-overlay.overlay
          nur.overlay
          nixpkgs-f2k.overlays.window-managers
        ];
      };
    in
    {
      nixosConfigurations = {
        shimakaze = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs username;
          };
          modules = [
            ./hosts/shimakaze/configuration.nix
            default-overlays
            wsl.nixosModules.wsl
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = ".bak";
                extraSpecialArgs = {
                  inherit
                    username
                    e-mail
                    nix-colors
                    nixvim
                    #nixvim-config
                    inputs
                    ;
                };
              };
              home-manager.users.${username}.imports = [ (import ./hosts/shimakaze/home.nix) ];
            }
          ];
        };
        roon = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs username nix-colors;
          };
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
                  inherit
                    username
                    e-mail
                    nix-colors
                    nixvim
                    #nixvim-config
                    nur
                    inputs
                    ;
                };
              };
              home-manager.users.${username}.imports = [ (import ./hosts/roon/home.nix) ];
            }
          ];
        };
        cheshire = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              username
              e-mail
              nix-colors
              ;
          };
          modules = [
            ./hosts/cheshire
            default-overlays
            home-manager.nixosModules.home-manager
            disko.nixosModules.default
            inputs.stylix.nixosModules.stylix # TODO Configure stylix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = ".bak";
                extraSpecialArgs = {
                  inherit
                    username
                    e-mail
                    nix-colors
                    nixvim
                    #nixvim-config
                    nur
                    inputs
                    ;
                };
                users.${username}.imports = [
                  (import ./hosts/cheshire/home.nix)
                  inputs.nyaa.homeManagerModule
                ];
              };
            }
          ];
        };
        laffey = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs username nix-colors;
          };
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
                  inherit
                    username
                    e-mail
                    nix-colors
                    nixvim
                    #nixvim-config
                    nur
                    ;
                };
              };
              home-manager.users.${username}.imports = [ (import ./hosts/laffey/home.nix) ];
            }
          ];
        };
        iso = lib.nixosSystem {
          inherit system;
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            ./hosts/iso/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit nix-colors e-mail;
                };
              };
              home-manager.users.${username}.imports = [ (import ./hosts/iso/home.nix) ];
            }
          ];
          specialArgs = {
            inherit
              self
              inputs
              username
              nixpkgs
              home-manager
              ;
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
        packages = with pkgs; [
          alejandra
          nixfmt-rfc-style
          git
          sops
          age
          deadnix
          #nil
          nixd
          statix
          inputs.disko.packages.${system}.disko
        ];
        name = "dotfiles";
        shellHook = ''
          export FLAKE=$(pwd)
        '';
        DIRENV_LOG_FORMAT = "";
        formatter = pkgs.nixfmt-rfc-style;
      };
    };
}
