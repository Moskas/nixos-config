{ config, lib, pkgs, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ../../modules/shell
    ../../modules/git
    ../../modules/editors
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-light-medium;

  # Read the changelog before changing this value
  home.stateVersion = "23.05";

  home.packages = with pkgs; [ ];

  # insert home-manager config
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(direnv hook bash)"
    '';
  };

  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "emacs";
    initExtra = ''
      eval "$(direnv hook bash)"
    '';
  };
}
