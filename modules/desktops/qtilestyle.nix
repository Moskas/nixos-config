{ config, ... }:

{

  # Creating special colors.py file for qtile styling
  home.file = {
    ".config/qtile/colorschemes/colors.py".text = ''
      colors = {
        "bg": "#${config.colorScheme.palette.base00}",
        "bg0": "#${config.colorScheme.palette.base01}",
        "bg1": "#${config.colorScheme.palette.base02}",
        "bg2": "#${config.colorScheme.palette.base03}",
        "fg": "#${config.colorScheme.palette.base06}",
        "fg0": "#${config.colorScheme.palette.base07}",
        "fg1": "#${config.colorScheme.palette.base05}",
        "fg2": "#${config.colorScheme.palette.base04}",
        "dark-red": "#${config.colorScheme.palette.base08}",
        "red": "#${config.colorScheme.palette.base08}",
        "dark-green": "#${config.colorScheme.palette.base0B}",
        "green": "#${config.colorScheme.palette.base0B}",
        "dark-yellow": "#${config.colorScheme.palette.base0A}",
        "yellow": "#${config.colorScheme.palette.base0A}",
        "dark-blue": "#${config.colorScheme.palette.base0A}",
        "blue": "#${config.colorScheme.palette.base0D}",
        "dark-magenta": "#${config.colorScheme.palette.base0D}",
        "magenta": "#${config.colorScheme.palette.base0E}",
        "dark-cyan": "#${config.colorScheme.palette.base0C}",
        "cyan": "#${config.colorScheme.palette.base0C}",
        "gray": "#${config.colorScheme.palette.base01}",
        "active": "#${config.colorScheme.palette.base07}",
        "inactive": "#${config.colorScheme.palette.base02}",
       }
    '';
  };

}
