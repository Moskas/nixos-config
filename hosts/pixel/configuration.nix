{ config, lib, pkgs, nix-on-droid, ... }:

{
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    neovim
    ranger
    wget
    curl
    git
    ripgrep
    nixfmt
  ];

  system.stateVersion = "23.05";
}
