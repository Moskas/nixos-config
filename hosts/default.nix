{ lib, inputs, nixpkgs, home-manager, username, e-mail, nur, NixOS-WSL, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
  #nur-modules = import nur {
  #  nurpgks = pkgs.legacyPackages.x86_64-linux;
  #};
in {
  virtual = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./virtual
      ./virtual/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username}.imports =
          [ (import ./virtual/home.nix) ];
      }
    ];
  };
  shimakaze = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./shimakaze/configuration.nix
      NixOS-WSL.nixosModules.wsl
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username e-mail; };
        home-manager.users.${username}.imports =
          [ (import ./shimakaze/home.nix) ];
      }
    ];
  };
  omen = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./common-configuration.nix
      ./omen
      ./omen/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username}.imports = [ (import ./omen/home.nix) ];
      }
    ];
  };
  cheshire = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username e-mail; };
    modules = [
      ./common-configuration.nix
      ./cheshire
      ./cheshire/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username e-mail; };
        home-manager.users.${username}.imports =
          [ (import ./cheshire/home.nix) ];
      }
    ];
  };
  optiplex = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./optiplex
      ./optiplex/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username}.imports =
          [ (import ./optiplex/home.nix) ];
      }
    ];
  };
  pixel = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./omen
      ./omen/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username}.imports = [ (import ./omen/home.nix) ];
      }
    ];
  };

  #omen =
  #  nixpkgs.lib.nixosSystem { modules = [ ./hosts/omen/configuration.nix ]; };
  #gungnir = nixpkgs.lib.nixosSystem {
  #  modules = [ ./hosts/gungnir/configuration.nix ];
  #};
}
