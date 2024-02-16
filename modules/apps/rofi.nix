{ config, pkgs, ... }:

{

  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 12";
    extraConfig = {
      modi = "drun";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
    location = "center";
    plugins = with pkgs; [ rofimoji rofi-power-menu rofi-bluetooth ];
    theme = let inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        # Theme settings
        highlight = "bold italic";
        scrollbar = true;

        dark-bg0 = mkLiteral "#${config.colorScheme.palette.base00}";
        dark-bg1 = mkLiteral "#${config.colorScheme.palette.base01}";
        dark-bg2 = mkLiteral "#${config.colorScheme.palette.base02}";
        dark-fg0 = mkLiteral "#${config.colorScheme.palette.base05}";
        dark-fg1 = mkLiteral "#${config.colorScheme.palette.base06}";
        dark-red-dark = mkLiteral "#${config.colorScheme.palette.base08}";
        dark-red-light = mkLiteral "#${config.colorScheme.palette.base08}";
        dark-yellow-dark = mkLiteral "#${config.colorScheme.palette.base0A}";
        dark-yellow-light = mkLiteral "#${config.colorScheme.palette.base0A}";
        dark-gray = mkLiteral "#${config.colorScheme.palette.base04}";

        # Theme colors
        background = mkLiteral "@dark-bg1";
        background-color = mkLiteral "@background";
        foreground = mkLiteral "@dark-fg1";
        border-color = mkLiteral "@dark-bg2";
        separatorcolor = mkLiteral "@border-color";
        scrollbar-handle = mkLiteral "@border-color";

        normal-background = mkLiteral "@background";
        normal-foreground = mkLiteral "@foreground";
        alternate-normal-background = mkLiteral "@dark-bg0";
        alternate-normal-foreground = mkLiteral "@foreground";
        selected-normal-background = mkLiteral "@dark-bg2";
        selected-normal-foreground = mkLiteral "@dark-fg0";

        active-background = mkLiteral "@dark-yellow-dark";
        active-foreground = mkLiteral "@background";
        alternate-active-background = mkLiteral "@active-background";
        alternate-active-foreground = mkLiteral "@active-foreground";
        selected-active-background = mkLiteral "@dark-yellow-light";
        selected-active-foreground = mkLiteral "@active-foreground";

        urgent-background = mkLiteral "@dark-red-dark";
        urgent-foreground = mkLiteral "@background";
        alternate-urgent-background = mkLiteral "@urgent-background";
        alternate-urgent-foreground = mkLiteral "@urgent-foreground";
        selected-urgent-background = mkLiteral "@dark-red-light";
        selected-urgent-foreground = mkLiteral "@urgent-foreground";
      };
      "window" = {
        background-color = mkLiteral "@background";
        border = 2;
        padding = 2;
      };

      "mainbox" = {
        border = 0;
        padding = 0;
      };

      "message" = {
        border = mkLiteral "2px 0 0";
        border-color = mkLiteral "@separatorcolor";
        padding = mkLiteral "1px";
      };

      "textbox" = {
        highlight = mkLiteral "@highlight";
        text-color = mkLiteral "@foreground";
      };

      "listview" = {
        border = mkLiteral "2px solid 0 0";
        padding = mkLiteral "2px 0 0";
        border-color = mkLiteral "@separatorcolor";
        spacing = mkLiteral "2px";
        scrollbar = mkLiteral "@scrollbar";
      };

      "element" = {
        border = mkLiteral "0";
        padding = mkLiteral "2px";
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[element-icon ,element-text ]";
        spacing = mkLiteral "5px";
      };

      "element.normal.normal" = {
        background-color = mkLiteral "@normal-background";
        text-color = mkLiteral "@normal-foreground";
      };

      "element.normal.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@urgent-foreground";
      };

      "element.normal.active" = {
        background-color = mkLiteral "@active-background";
        text-color = mkLiteral "@active-foreground";
      };

      "element.selected.normal" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
      };

      "element.selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@selected-urgent-foreground";
      };

      "element.selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
      };

      "element.alternate.normal" = {
        background-color = mkLiteral "@alternate-normal-background";
        text-color = mkLiteral "@alternate-normal-foreground";
      };

      "element.alternate.urgent" = {
        background-color = mkLiteral "@alternate-urgent-background";
        text-color = mkLiteral "@alternate-urgent-foreground";
      };

      "element.alternate.active" = {
        background-color = mkLiteral "@alternate-active-background";
        text-color = mkLiteral "@alternate-active-foreground";
      };

      "scrollbar" = {
        width = mkLiteral "4px";
        border = mkLiteral "0";
        handle-color = mkLiteral "@scrollbar-handle";
        handle-width = mkLiteral "8px";
        padding = mkLiteral "0";
      };

      "mode-switcher" = {
        border = mkLiteral "2px 0 0";
        border-color = mkLiteral "@separatorcolor";
      };

      "inputbar" = {
        spacing = mkLiteral "0";
        text-color = mkLiteral "@normal-foreground";
        padding = mkLiteral "2px";
        children =
          mkLiteral "[ prompt, textbox-prompt-sep, entry, case-indicator ]";
      };

      "case-indicator,\nentry,\nprompt,\nbutton" = {
        spacing = mkLiteral "0";
        text-color = mkLiteral "@normal-foreground";
      };

      "button.selected" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
      };

      "textbox-prompt-sep" = {
        expand = false;
        str = mkLiteral ''":"'';
        text-color = mkLiteral "@normal-foreground";
        margin = mkLiteral "0 0.3em 0 0";
      };
      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
    };
    terminal = "${pkgs.kitty}/bin/kitty";
  };

}
