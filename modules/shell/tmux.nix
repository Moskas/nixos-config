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
        extraConfig = "set -g @continuum-restore 'on'";
      }
      {
        plugin = (pkgs.tmuxPlugins.catppuccin.overrideAttrs
          (o: { patches = (o.patches or [ ]) ++ [ ./catppuccin.patch ]; }));
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      tmuxPlugins.tilish
      tmuxPlugins.tmux-fzf
      tmuxPlugins.yank
      #tmuxPlugins.vim-tmux-navigator
    ];
  };
}
