{ config, lib, pkgs, username, ... }:

{
  imports = [ ./redshift.nix ./flameshot.nix ./picom.nix ./dunst.nix ];
}
