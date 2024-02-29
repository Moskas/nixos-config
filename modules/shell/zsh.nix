{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = { e = "$EDITOR"; };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    autocd = false;
    defaultKeymap = "emacs";
    plugins = [ ];
    shellAliases = { cat = "bat --decorations=never --paging=never"; };
    initExtra = ''
      export PATH=~/.config/emacs/bin:$PATH
      export PATH=~/.local/share/applications/:$PATH
      export PATH=~/.cargo/bin/:$PATH
    '';
  };
}
