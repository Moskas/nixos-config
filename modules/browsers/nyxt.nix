{ pkgs, config, ... }:

{
  home = {
    packages = with pkgs; [ nyxt ];
  };
  xdg.configFile."nyxt/theme.lisp".text = ''
    (define-configuration browser
    ((session-restore-prompt :always-restore)
     (theme (make-instance
             'theme:theme
             :dark-p t
             :font-family "JetBrainsMono Nerd Font"
             :background-color "${config.colorScheme.palette.base00}"
             :background-color+ "${config.colorScheme.palette.base00}"
             :background-color- "${config.colorScheme.palette.base01}"
             :codeblock-color "${config.colorScheme.palette.base00}"
             :text-color "${config.colorScheme.palette.base05}"
             :text-color+ "${config.colorScheme.palette.base06}"
             :text-color- "${config.colorScheme.palette.base05}"
             :accent-color "${config.colorScheme.palette.base0C}"
             :primary-color "${config.colorScheme.palette.base05}"
             :secondary-color "${config.colorScheme.palette.base00}"
             :tertiary-color "${config.colorScheme.palette.base00}"
             :contrast-text-color "${config.colorScheme.palette.base00}"
             :action-color "${config.colorScheme.palette.base0C}"
             :action-color+ "${config.colorScheme.palette.base0C}"
             :action-color- "${config.colorScheme.palette.base0C}"
             :quaternary-color "${config.colorScheme.palette.base01}"))))
  '';
}
