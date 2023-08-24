{ config, lib, pkgs, e-mail, ... }:
{
  programs.lazygit = {
    enable = true;
  };
}