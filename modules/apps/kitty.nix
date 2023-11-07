{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 5
      font_family JetBrainsMono Nerd Font
      bold_font auto
      italic_font auto
      bold_italic_font  auto
      font_size 12
      disable_ligatures never

      tab_bar_edge bottom
      tab_bar_style powerline
      tab_powerline_style slanted
      active_tab_font_style   bold-italic
      inactive_tab_font_style normal
      confirm_os_window_close 0
      cursor                  #${config.colorScheme.colors.base03}
      cursor_text_color       background

      url_color               #${config.colorScheme.colors.base0D}

      visual_bell_color       #${config.colorScheme.colors.base0C}
      bell_border_color       #${config.colorScheme.colors.base0C}

      active_border_color     #${config.colorScheme.colors.base0E}
      inactive_border_color   #${config.colorScheme.colors.base03}

      foreground              #${config.colorScheme.colors.base06}
      background              #${config.colorScheme.colors.base00}
      selection_foreground    #${config.colorScheme.colors.base03}
      selection_background    #${config.colorScheme.colors.base06}

      active_tab_foreground   #${config.colorScheme.colors.base07}
      active_tab_background   #${config.colorScheme.colors.base03}
      inactive_tab_foreground #${config.colorScheme.colors.base04}
      inactive_tab_background #${config.colorScheme.colors.base02}

      # black  (bg3/bg4)
      color0                  #${config.colorScheme.colors.base03}
      color8                  #${config.colorScheme.colors.base03}

      # red
      color1                  #${config.colorScheme.colors.base08}
      color9                  #${config.colorScheme.colors.base08}

      #: green
      color2                  #${config.colorScheme.colors.base0B}
      color10                 #${config.colorScheme.colors.base0B}

      # yellow
      color3                  #${config.colorScheme.colors.base0A}
      color11                 #${config.colorScheme.colors.base0A}

      # blue
      color4                  #${config.colorScheme.colors.base0D}
      color12                 #${config.colorScheme.colors.base0D}

      # purple
      color5                  #${config.colorScheme.colors.base0E}
      color13                 #${config.colorScheme.colors.base0E}

      # aqua
      color6                  #${config.colorScheme.colors.base0C}
      color14                 #${config.colorScheme.colors.base0C}

      # white (fg4/fg3)
      color7                  #${config.colorScheme.colors.base06}
      color15                 #${config.colorScheme.colors.base07}
      selection_foreground    #${config.colorScheme.colors.base07}
    '';
  };

}
