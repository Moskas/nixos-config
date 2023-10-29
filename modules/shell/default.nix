{ config, lib, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./zsh.nix
    ./zoxide.nix
    ./btop.nix
    ./bat.nix
    ./newsboat.nix
    ./eza.nix
    #./xresources.nix # Seems to be not loading properly? Perhaps apps don't like symlinks
  ];
}
