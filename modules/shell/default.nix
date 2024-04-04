{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./newsboat.nix
    ./neofetch.nix
    ./ranger.nix
    ./starship.nix
    ./tickrs.nix
    ./tmux.nix
    ./xresources.nix
    ./yazi.nix
    ./zsh.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    jq
    du-dust
    duf
    amfora
    (callPackage ../../pkgs/whdl.nix { })
    (callPackage ../../pkgs/epy.nix { })
    (callPackage ../../pkgs/donkeytype.nix { })
    onefetch
    zip
    unzip
    unrar
    p7zip
    wget
    nurl
    rates
    ripgrep
  ];
}
