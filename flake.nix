{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = { url = "github:nix-community/NUR"; };
    #nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:t184256/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, nur, NixOS-WSL, nix-on-droid, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "moskas";
      e-mail = "minemoskas@gmail.com";
    in
    {
      nixOnDroidConfigurations.z23 = nix-on-droid.lib.nixOnDroidConfiguration
        {
          modules = [
            ./hosts/pixel/configuration.nix
          ];
        };

      nixosConfigurations = (import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager username e-mail nur NixOS-WSL;
      });
    };
}
