{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      e = "$EDITOR";
      b = "ranger";
      cat = "bat --decorations=never --paging=never";
      tx = "tmux new -As0";
      lld = "ll --no-permissions --no-user --no-time --no-git --no-filesize --tree -D";
      duf = "duf -theme ansi";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = false;
    defaultKeymap = "emacs";
    plugins = [ ];
    initExtra = ''
      source ${pkgs.zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh
      export PATH=~/.config/emacs/bin:$PATH # Doom Emacs helper bin
      export PATH=~/.local/share/applications/:$PATH # Kinda redundant but eh
      export PATH=~/.cargo/bin/:$PATH # For rare occasion that I might need a Rust app from cargo

      # Legend
      # '^' = CTRL, '^[' = ESC
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region
      bindkey '^[\[1;5C' forward-word
      bindkey '^[\[1;5D' backward-word
    '';
  };
}
