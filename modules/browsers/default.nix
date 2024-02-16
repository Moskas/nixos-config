{ config, pkgs, ... }:

{
  imports = [ ./brave.nix ./firefox.nix ];
}
