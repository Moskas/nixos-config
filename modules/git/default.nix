{ config, pkgs, ... }:

{
  imports = [ ./git.nix ./lazygit.nix ./gh.nix ];
}
