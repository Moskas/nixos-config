{ config, pkgs, username, ... }:

{
  imports = [ ./neomutt.nix ./thunderbird.nix ];
}
