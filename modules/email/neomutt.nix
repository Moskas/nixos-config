{ config, lib, pkgs, ... }:

{
  programs.neomutt = {
    enable = true;
    vimKeys = true;
  };
}
