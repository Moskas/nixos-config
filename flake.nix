{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stable-home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgsStable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, nixpkgsStable, home-manager, nur, wsl, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = (import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs nixpkgsStable home-manager username e-mail nur wsl;
      });
    };
}
