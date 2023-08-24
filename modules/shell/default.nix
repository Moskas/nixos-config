{ config, lib, pkgs, ... }:

{
  imports = [ ./starship.nix ./zsh.nix ./zoxide.nix ./btop.nix ./bat.nix ./newsboat.nix ./exa.nix];
}
