{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations =
        #        virtual = nixpkgs.lib.nixosSystem {
        #          modules = [ ./hosts/virtual/configuration.nix ];
        #        };
        #        omen = nixpkgs.lib.nixosSystem {
        #          modules = [ ./hosts/omen/configuration.nix ];
        #        };
        #        gungnir = nixpkgs.lib.nixosSystem {
        #          modules = [ ./hosts/gungnir/configuration.nix ];
        #        };
        (import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager;
        });
      #homeConfigurations = {
      #  moskas = home-manager.lib.homeManagerConfiguration {
      #    inherit pkgs;
      #    modules = [ ./hosts/virtual/home.nix ];
      #  };
    };
}
