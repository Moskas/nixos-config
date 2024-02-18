{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ nh rnix-lsp nixfmt ];

  nix = {

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    sshServe = {
      enable = true;
      write = true;
    };

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = [ "root" "moskas" "@wheel" "nix-ssh" ];
      substituters =
        [ "https://nix-community.cachix.org" "https://cache.nixos.org/" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    extraOptions = ''
      warn-dirty = false
    '';

  };

  environment.sessionVariables = {
    NIX_SSHOPS = "-tt";
    FLAKE = "/home/moskas/Projects/nixos-config";
  };
  # Additional config for nixpkgs, mainly unfree due to Discord, Steam etc
  nixpkgs = { config = { allowUnfree = true; }; };
}
