{ config, pkgs, ... }:

{
  imports = [ ../../modules/shell ../../modules/git ../../modules/editors ];

  home.username = "moskas";
  home.homeDirectory = "/home/moskas";
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [ ];
}
