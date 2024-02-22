{ config, pkgs, ... }: {
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
    ./neofetch.nix
  ];

  home.packages = with pkgs; [
    jq
    du-dust
    duf
    direnv
    nix-direnv
    (callPackage ../../pkgs/whdl.nix { })
    (callPackage ../../pkgs/epy.nix { })
    (callPackage ../../pkgs/donkeytype.nix { })
    onefetch
    ranger
    zip
    unzip
    unrar
    p7zip
    wget
    nurl
    rates
    tickrs
    ripgrep
  ];
}
