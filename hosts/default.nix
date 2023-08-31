{ lib, inputs, nixpkgs, home-manager, username, e-mail, nur, wsl, ... }:

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
  shimakaze = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./shimakaze/configuration.nix
      wsl.nixosModules.wsl
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
        home-manager.extraSpecialArgs = { inherit username e-mail; };
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
  laffey = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [
      ./laffey
      ./laffey/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username}.imports =
          [ (import ./laffey/home.nix) ];
      }
    ];
  };
}
