{
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

  #colorScheme = nix-colors.colorSchemes.gruvbox-light-medium;
  colorScheme = (import ../../modules/desktops/theming/colorschemes/matcha-dark.nix);

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

  #programs.starship = {
  #  settings = {
  #    format = pkgs.lib.mkForce (
  #      pkgs.lib.concatStrings [
  #        "$os$hostname$rust$python$node$lua$git_branch$git_status$git_state$nix_shell$line_break$directory$sudo$character"
  #      ]
  #    );
  #    hostname.style = pkgs.lib.mkForce "fg:bg bg:blue bold";
  #  };
  #};

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
