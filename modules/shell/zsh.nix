{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      #ls = "exa --grid --color always --icons --sort=type";
      #ll = "exa --long --color always --icons --sort=type";
      #la = "exa --grid --all --color auto --icons --sort=type";
      #lla = "exa --long --all --color auto --icons --sort=type";
      e = "$EDITOR";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    autocd = false;
    defaultKeymap = "emacs";
    plugins = [ ];
    initExtra = ''
      export PATH=~/.config/emacs/bin:$PATH
      export PATH=~/.local/share/applications/:$PATH
      eval "$(direnv hook zsh)"
      export PATH=~/.cargo/bin/:$PATH
    '';
  };
}
