{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (callPackage ../scripts/battery.nix { })
    (callPackage ../scripts/check-ssh.nix { })
  ];

  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    keyMode = "emacs";
    baseIndex = 1;
    shortcut = "Space";
    terminal = "screen-256color";
    historyLimit = 20000;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      set -g pane-border-style fg=default
      set -g pane-active-border-style fg=default

      set-window-option -g window-status-style fg=brightblack,bg=default,dim
      set-window-option -g window-status-current-style fg=green,bg=default,bright
      set -g window-status-separator '#[fg=brightblack] | '

      set-option -g pane-border-style fg=black
      set-option -g pane-active-border-style fg=green

      set -g status-left ' #[fg=blue,bg=default]  #[fg=blue]#(check-ssh) '
      set -g status-right '#[fg=blue] #[fg=blue]#{b:pane_current_path} #[fg=magenta] #[fg=magenta,bg=default]%d.%a %H:%M:%S#[default]#[fg=cyan]#(echo $(bat-stat)) #[fg=cyan] #S'
      set -g status-style bg=default,fg=default
      set -g status-left-length 40
      set -g status-right-length 80

      set-window-option -g window-status-format "#I:#W"

      set-option -g pane-border-style fg=brightblack
      set-option -g pane-active-border-style fg=green

      set -g status-interval 1 # Update status every second

      set -g message-style bg=default,fg=white

      set-window-option -g allow-rename on
      set-option -g set-titles off
      set-option -sa terminal-overrides ',xterm*:Tc'
      set-option -g renumber-windows on
      set -s escape-time 0
      bind - select-layout even-horizontal
      bind _ select-layout even-vertical
      bind V split-window -h -c '#{pane_current_path}'
      bind S split-window -v -c '#{pane_current_path}'
      bind r source-file ~/.config/tmux/tmux.conf\;\
        display 'Config reloaded'
      unbind '%'
      unbind '"'
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
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.tilish
      tmuxPlugins.tmux-fzf
      tmuxPlugins.yank
      tmuxPlugins.extrakto
      tmuxPlugins.vim-tmux-navigator
    ];
  };
}
