{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nur, wsl, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} { config.allowUnfree = true; };
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = (import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager username e-mail nur wsl;
      });
    };
}
