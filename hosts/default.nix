{ lib, nixpkgs, home-manager, username, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in {
  virtual = nixpkgs.lib.nixosSystem {
    modules = [ ./hosts/virtual/configuration.nix ];
  };
  omen =
    nixpkgs.lib.nixosSystem { modules = [ ./hosts/omen/configuration.nix ]; };
  gungnir = nixpkgs.lib.nixosSystem {
    modules = [ ./hosts/gungnir/configuration.nix ];
  };
}
