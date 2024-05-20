{ config, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      e = "$EDITOR";
      cat = "bat --decorations=never --paging=never";
      tx = "tmux new -As0";
      lld = "ll --no-permissions --no-user --no-time --no-git --no-filesize --tree -D";
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
      export PATH=~/.config/emacs/bin:$PATH
      export PATH=~/.local/share/applications/:$PATH
      export PATH=~/.cargo/bin/:$PATH

      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region
    '';
  };
}
