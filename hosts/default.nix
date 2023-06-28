{ lib, inputs, nixpkgs, home-manager, username, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
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
  omen = lib.nixosSystem {
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
