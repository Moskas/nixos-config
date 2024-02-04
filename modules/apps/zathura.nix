{ config, lib, pkgs, ... }:

{

  programs.zathura = {
    enable = true;
    options = {
      notification-error-bg = "#${config.colorScheme.palette.base00}"; # bg
      notification-error-fg =
        "#${config.colorScheme.palette.base08}"; # bright:red
      notification-warning-bg = "#${config.colorScheme.palette.base00}"; # bg
      notification-warning-fg =
        "#${config.colorScheme.palette.base0A}"; # bright:yellow
      notification-bg = "#${config.colorScheme.palette.base00}"; # bg
      notification-fg = "#${config.colorScheme.palette.base0B}"; # bright:green

      completion-bg = "#${config.colorScheme.palette.base01}"; # bg2
      completion-fg = "#${config.colorScheme.palette.base06}"; # fg
      completion-group-bg = "#${config.colorScheme.palette.base02}"; # bg1
      completion-group-fg = "#${config.colorScheme.palette.base03}"; # gray
      completion-highlight-bg =
        "#${config.colorScheme.palette.base0D}"; # bright:blue
      completion-highlight-fg = "#${config.colorScheme.palette.base01}"; # bg2

      # Define the color in index mode
      index-bg = "#${config.colorScheme.palette.base01}"; # bg2
      index-fg = "#${config.colorScheme.palette.base06}"; # fg
      index-active-bg = "#${config.colorScheme.palette.base0D}"; # bright:blue
      index-active-fg = "#${config.colorScheme.palette.base01}"; # bg2

      inputbar-bg = "#${config.colorScheme.palette.base00}"; # bg
      inputbar-fg = "#${config.colorScheme.palette.base06}"; # fg

      statusbar-bg = "#${config.colorScheme.palette.base01}"; # bg2
      statusbar-fg = "#${config.colorScheme.palette.base06}"; # fg

      highlight-color = "#${config.colorScheme.palette.base0A}"; # bright:yellow
      highlight-active-color =
        "#${config.colorScheme.palette.base09}"; # bright:orange

      default-bg = "#${config.colorScheme.palette.base00}"; # bg
      default-fg = "#${config.colorScheme.palette.base06}"; # fg
      render-loading = true;
      render-loading-bg = "#${config.colorScheme.palette.base00}"; # bg
      render-loading-fg = "#${config.colorScheme.palette.base06}"; # fg

      # Recolor book content's color
      recolor-lightcolor = "#${config.colorScheme.palette.base00}"; # bg
      recolor-darkcolor = "#${config.colorScheme.palette.base06}"; # fg
      recolor = true;
      recolor-keephue = false; # keep original color
    };
  };

}
