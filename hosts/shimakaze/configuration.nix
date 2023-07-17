{ lib, pkgs, config, modulesPath, ... }:

{
  imports = [ "${modulesPath}/profiles/minimal.nix" ];

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

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.systemPackages = with pkgs; [
    neofetch
    onefetch
    btop
    neovim
    ranger
    wget
    git
    ripgrep
    nixfmt
    exa
    zoxide
  ];

  system.stateVersion = "22.05";
}
