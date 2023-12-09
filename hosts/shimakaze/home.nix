{ config, pkgs, lib, username, e-mail, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/git
    ../../modules/shell
    #../../modules/media/mpv.nix
    ../../modules/editors/neovim.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [ rnix-lsp ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs28-gtk2;
  };

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
