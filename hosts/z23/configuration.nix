{ config, lib, pkgs, nix-on-droid, ... }:

{
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #users.defaultUserShell = pkgs.zsh;

  environment.packages = with pkgs; [
    neovim
    ranger
    wget
    curl
    git
    ripgrep
    nixfmt
    neofetch
    onefetch
  ];

  #home-manager.config = ./home.nix;
  system.stateVersion = "23.05";
}
