{ config, ... }:

{
  xresources = {
    properties = {
      "*foreground" = "#${config.colorScheme.palette.base06}";
      "*background" = "#${config.colorScheme.palette.base00}";
      "*color0" = "#${config.colorScheme.palette.base03}";
      "*color1" = "#${config.colorScheme.palette.base08}";
      "*color2" = "#${config.colorScheme.palette.base0B}";
      "*color3" = "#${config.colorScheme.palette.base0A}";
      "*color4" = "#${config.colorScheme.palette.base0D}";
      "*color5" = "#${config.colorScheme.palette.base0E}";
      "*color6" = "#${config.colorScheme.palette.base0C}";
      "*color7" = "#${config.colorScheme.palette.base06}";
      "*color8" = "#${config.colorScheme.palette.base03}";
      "*color9" = "#${config.colorScheme.palette.base08}";
      "*color10" = "#${config.colorScheme.palette.base0B}";
      "*color11" = "#${config.colorScheme.palette.base0A}";
      "*color12" = "#${config.colorScheme.palette.base0D}";
      "*color13" = "#${config.colorScheme.palette.base0E}";
      "*color14" = "#${config.colorScheme.palette.base0C}";
      "*color15" = "#${config.colorScheme.palette.base07}";
      "xterm*font" = "JetBrainsMono Nerd Font 10";
      "xterm*faceName" = "JetBrainsMono Nerd Font";
      "xterm*faceSize" = "12";
      #"Xcursor.theme" = "phinger-cursors-light";
      #"Xcursor.size" = "16";
      "Xft.dpi" = "100";
    };
  };
}
