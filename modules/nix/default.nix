{ pkgs, ... }: {
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
      use-xdg-base-directories = true;
      trusted-users = [ "root" "moskas" "@wheel" "nix-ssh" ];
      warn-dirty = false;
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };

    #extraOptions = ''
    #  warn-dirty = false
    #'';
  };

  environment.sessionVariables = {
    NIX_SSHOPS = "-tt";
    FLAKE = "/home/moskas/Projects/nixos-config";
  };
  # Additional config for nixpkgs, mainly unfree due to Discord, Steam etc
  nixpkgs = { config = { allowUnfree = true; }; };
}
