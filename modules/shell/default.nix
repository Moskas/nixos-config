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
    ./tmux.nix
    #./xresources.nix
  ];

  home.packages = with pkgs; [
    jq
    du-dust
    duf
    (pkgs.neofetch.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [ ./neofetch-nixos-small.patch ];
    }))
    onefetch
    ranger
    zip
    unzip
    unrar
    p7zip
    wget
  ];
}
