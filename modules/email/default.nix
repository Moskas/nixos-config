{ config, lib, pkgs, username, ... }:

{
  imports = [ ./neomutt.nix ./thunderbird.nix ];
}
