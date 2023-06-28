{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "moskas";
    in
    {
      nixosConfigurations =
        (import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager username nur;
        });
    };
}
