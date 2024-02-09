{ config, pkgs, ... }:

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
    ./yazi.nix
    ./xresources.nix
  ];

  home.packages = with pkgs; [
    jq
    du-dust
    duf
    direnv
    nix-direnv
    (pkgs.neofetch.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [ ./neofetch-nixos-small.patch ];
    }))
    (callPackage ../../pkgs/whdl.nix { })
    (callPackage ../../pkgs/epy.nix { })
    onefetch
    ranger
    zip
    unzip
    unrar
    p7zip
    wget
    nurl
  ];
}
