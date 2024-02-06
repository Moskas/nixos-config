{ config, pkgs, ... }:

{
  imports = [ ./gitea.nix ./grocy.nix ./jellyfin.nix ./tailscale.nix ];
}
