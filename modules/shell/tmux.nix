{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    keyMode = "emacs";
    baseIndex = 1;
    shortcut = "Space";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = "set-option -sa terminal-overrides ',xterm*:Tc'";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig =
          "set -g @continuum-restore 'on'";
      }
      tmuxPlugins.tilish
      tmuxPlugins.tmux-fzf
      tmuxPlugins.yank
      #tmuxPlugins.vim-tmux-navigator
    ];
  };
}
