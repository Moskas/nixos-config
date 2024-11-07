{ nix-colors, nur, ... }:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/common/home
    ../../modules/browsers
    ../../modules/editors
    ../../modules/git
    ../../modules/apps
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  home.stateVersion = "22.11";
}
