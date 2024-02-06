{ config, pkgs, username, ... }:

{
  imports = [
    ./redshift.nix
    ./flameshot.nix
    ./picom.nix
    ./dunst.nix
    ./easyeffects.nix
    ./wlsunset.nix
  ];
}
