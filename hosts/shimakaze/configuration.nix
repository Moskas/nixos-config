{ lib, pkgs, config, modulesPath, ... }:

{
  imports =
    [ "${modulesPath}/profiles/minimal.nix" ../../modules/scripts/diff.nix ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    #automountPath = "/mnt";
    defaultUser = "moskas";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;
    wslConf.network.generateResolvConf = false;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    settings = { builders-use-substitutes = true; };
  };
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  users.users.moskas = {
    isNormalUser = true;
    description = "Moskas";
    extraGroups = [ "wheel" "storage" ];
    shell = pkgs.zsh;
  };

  networking = {
    hostName = "shimakaze";
    nameservers = [ "1.1.1.1" ];
  };

  time.timeZone = "Europe/Warsaw";

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.systemPackages = with pkgs; [
    wget
    git
    ripgrep
    nixfmt
    direnv
    cmake
    pkg-config
  ];

  environment.noXlibs = false;

  environment.variables = { EDITOR = "nvim"; };

  system.stateVersion = "22.05";
}
