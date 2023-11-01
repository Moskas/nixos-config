{ config, lib, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "20x50";
        origin = "top-right";
        padding = 8;
        gap_size = 5;
        gaps = true;
        transparency = 10;
        max_icon_size = 90;
        min_icon_size = 32;
        frame_color = "#${config.colorScheme.colors.base06}";
        font = "JetBrainsMono Nerd Font 10";
        format = ''
          <b>%s</b>
          %b'';
        show_indicators = false;
      };

      urgency_normal = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base07}";
        timeout = 10;
      };

      discord = {
        appname = ".Discord-wrapped";
        frame_color = "#d3869b";
      };

      flameshot = {
        appname = ".flameshot-wrapped";
        frame_color = "#cc241d";
      };
    };
  };

}
