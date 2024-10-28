{
  lib,
  pkgs,
  username,
  nix-colors,
  ...
}:
{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/git
    ../../modules/shell
    ../../modules/shell/tmux.nix
    ../../modules/editors/emacs.nix
    ../../modules/editors/neovim.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
  #colorScheme = (import ../../modules/desktops/theming/colorschemes/matcha-dark.nix);

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      nmap
      w3m
      ollama
      (callPackage ../../modules/scripts/wsl-mount.nix { })
    ];
  };

  extraShell = true;

  services.emacs.startWithUserSession = lib.mkForce true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
