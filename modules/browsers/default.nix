{ config, pkgs, ... }:

{
  imports = [ ./brave.nix ./firefox.nix ./qutebrowser.nix ];
}
