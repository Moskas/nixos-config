{ pkgs, nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/shell
    ../../modules/git
    ../../modules/email/mu4u.nix
    ../../modules/email/neomutt.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  # Read the changelog before changing this value
  home.stateVersion = "23.05";

  home.packages = with pkgs; [ ];

  # insert home-manager config
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"
      zsh
    '';
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraPackages =
      epkgs: with epkgs; [
        vterm-toggle
        mu4e
      ];
  };

  programs.neovim.enable = true;
}
