{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    neovim
    ranger
    wget
    curl
    git
    ripgrep
    home-manager
    nixfmt
  ];

  system.stateVersion = "23.05";
}
