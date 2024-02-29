{ pkgs, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/shell
    ../../modules/git
    ../../modules/editors
    ../../modules/apps/kitty.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  home = {
    username = "moskas";
    homeDirectory = "/home/moskas";
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [ ];
}
