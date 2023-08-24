{ config, lib, pkgs, ... }:

{
  imports = [ ./git.nix ./lazygit.nix ./gh.nix ];
}
