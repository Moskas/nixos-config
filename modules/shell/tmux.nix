{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    keyMode = "emacs";
    baseIndex = 1;
    shortcut = "Space";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      set-option -sa terminal-overrides ',xterm*:Tc'
      set-option -g renumber-windows on
      set -s escape-time 0
      bind V split-window -h -c '#{pane_current_path}'
      bind S split-window -v -c '#{pane_current_path}'
      unbind '%'
      unbind '"'
      bind C-l send-keys 'C-l'
    '';
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
        plugin = pkgs.tmuxPlugins.catppuccin.overrideAttrs
          (o: { patches = (o.patches or [ ]) ++ [ ./catppuccin.patch ]; });
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.tilish
      tmuxPlugins.tmux-fzf
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
    ];
  };
}
