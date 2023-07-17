{ config, lib, pkgs, nix-on-droid, ... }:

{
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  environment.packages = with pkgs; [
    neovim
    ranger
    wget
    curl
    git
    ripgrep
    nixfmt
  ];

  home-manager.config = ./home.nix;
  system.stateVersion = "23.05";
}
