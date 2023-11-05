{ config, lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
    languages = {
      language = [{
        name = "rust";
        auto-format = true;
      }];
    };
    themes = {
      base16 = let
        transparent = "none";
        gray = "#${config.colorScheme.colors.base03}";
        dark-gray = "#${config.colorScheme.colors.base01}";
        white = "#${config.colorScheme.colors.base07}";
        black = "#${config.colorScheme.colors.base00}";
        red = "#${config.colorScheme.colors.base08}";
        green = "#${config.colorScheme.colors.base0B}";
        yellow = "#${config.colorScheme.colors.base0A}";
        orange = "#${config.colorScheme.colors.base09}";
        blue = "#${config.colorScheme.colors.base0D}";
        magenta = "#${config.colorScheme.colors.base0E}";
        cyan = "#${config.colorScheme.colors.base0C}";
      in {
        "ui.menu" = transparent;
        "ui.menu.selected" = { modifiers = [ "reversed" ]; };
        "ui.linenr" = {
          fg = gray;
          bg = dark-gray;
        };
        "ui.popup" = { modifiers = [ "reversed" ]; };
        "ui.linenr.selected" = {
          fg = white;
          bg = black;
          modifiers = [ "bold" ];
        };
        "ui.selection" = {
          fg = black;
          bg = blue;
        };
        "ui.selection.primary" = { modifiers = [ "reversed" ]; };
        "comment" = { fg = gray; };
        "ui.statusline" = {
          fg = white;
          bg = dark-gray;
        };
        "ui.statusline.inactive" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.help" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "variable" = red;
        "variable.builtin" = orange;
        "constant.numeric" = orange;
        "constant" = orange;
        "attributes" = yellow;
        "type" = yellow;
        "ui.cursor.match" = {
          fg = yellow;
          modifiers = [ "underlined" ];
        };
        "string" = green;
        "variable.other.member" = red;
        "constant.character.escape" = cyan;
        "function" = blue;
        "constructor" = blue;
        "special" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = { modifiers = [ "underlined" ]; };
        "ui.gutter" = { bg = black; };
        "info" = blue;
        "hint" = dark-gray;
        "debug" = dark-gray;
        "warning" = yellow;
        "error" = red;
      };
    };
  };
}
