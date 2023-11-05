{ config, lib, pkgs, ... }:

{

  # Creating special colors.py file for qtile styling
  home.file = {
    ".config/qtile/colorschemes/colors.py".text = ''
      colors = {
        "bg": "#${config.colorScheme.colors.base00}",
        "bg0": "#${config.colorScheme.colors.base01}",
        "bg1": "#${config.colorScheme.colors.base02}",
        "bg2": "#${config.colorScheme.colors.base03}",
        "fg": "#${config.colorScheme.colors.base06}",
        "fg0": "#${config.colorScheme.colors.base07}",
        "fg1": "#${config.colorScheme.colors.base05}",
        "fg2": "#${config.colorScheme.colors.base04}",
        "dark-red": "#${config.colorScheme.colors.base08}",
        "red": "#${config.colorScheme.colors.base08}",
        "dark-green": "#${config.colorScheme.colors.base0B}",
        "green": "#${config.colorScheme.colors.base0B}",
        "dark-yellow": "#${config.colorScheme.colors.base0A}",
        "yellow": "#${config.colorScheme.colors.base0A}",
        "dark-blue": "#${config.colorScheme.colors.base0A}",
        "blue": "#${config.colorScheme.colors.base0D}",
        "dark-magenta": "#${config.colorScheme.colors.base0D}",
        "magenta": "#${config.colorScheme.colors.base0E}",
        "dark-cyan": "#${config.colorScheme.colors.base0C}",
        "cyan": "#${config.colorScheme.colors.base0C}",
        "gray": "#${config.colorScheme.colors.base01}",
        "active": "#${config.colorScheme.colors.base07}",
        "inactive": "#${config.colorScheme.colors.base02}",
       }
    '';
  };

}
