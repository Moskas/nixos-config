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
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nur, nixpkgs-stable, home-manager-stable, NixOS-WSL, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
    in
    {
      nixosConfigurations =
        (import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager username e-mail nur nixpkgs-stable home-manager-stable NixOS-WSL;
        });
    };
}
