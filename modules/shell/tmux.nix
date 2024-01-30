{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    keyMode = "emacs";
    baseIndex = 1;
    shortcut = "Space";
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      tmuxPlugins.cpu
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
    ];
  };
}
