{ config, pkgs, ... }:

{
  imports = [ ./gitea.nix ./jellyfin.nix ];
}
