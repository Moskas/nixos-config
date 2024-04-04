{ nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/shell
    ../../modules/git
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  home.stateVersion = "23.11";
}
