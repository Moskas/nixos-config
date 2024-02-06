{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ nh ];

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
    };
    extraOptions = ''
      warn-dirty = false
    '';

  };

  environment.variables = {
    NIX_SSHOPS = "-tt";
    FLAKE = "/home/moskas/Projects/nixos-config";
  };
  # Additional config for nixpkgs, mainly unfree due to Discord, Steam etc
  nixpkgs = { config = { allowUnfree = true; }; };
}
