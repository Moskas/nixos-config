{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      palette = "dynamic";
      format = ''
        $hostname$directory$character
      '';
      #$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$fill$nix_shell$time$line_break$directory$sudo
      right_format = ''$nix_shell$rust$python$node$lua$git_status$git_state$git_branch'';
      scan_timeout = 10;
      character = {
        success_symbol = "[ ](blue)";
        error_symbol = "[ ](red)";
      };
      fill = {
        symbol = " ";
      };
      time = {
        disabled = false;
        format = "[ 󰅐 $time ]($style)";
        time_format = "%T";
        style = "fg:bg  bg:cyan bold";
      };
      username = {
        disabled = false;
        style_user = "fg:bg bg:blue bold";
        style_root = "fg:red bg:blue  italic";
        format = "[ $user ]($style)";
        show_always = true;
      };
      hostname = {
        ssh_only = true;
        ssh_symbol = "󰣀 ";
        format = "[ $hostname ]($style)";
        style = " fg:bg bg:dark-cyan bold";
        disabled = false;
      };
      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = " 󰍛 ";
        format = "[$symbol]($style)[$ram( | $swap) ]($style)";
        style = " fg:bg bg:green";
      };
      directory = {
        read_only = " ";
        home_symbol = " ~";
        truncation_length = 4;
        truncation_symbol = "…/";
        truncate_to_repo = true;
      };
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = "󰝚 ";
        "Pictures" = " ";
        "Org" = "";
        "Repos" = "";
        "Projects" = "";
        "Mail" = "";
      };
      rust = {
        symbol = "🦀";
        format = "[ $symbol $version ](fg:yellow bg:bg bold)";
      };
      python = {
        symbol = "";
        format = "[ $symbol $version ](fg:yellow bg:bg bold)";
      };
      c = {
        symbol = "";
        detect_extensions = ''["c", "h", "cpp"]'';
      };
      lua = {
        symbol = "";
        format = "[ $symbol $version ](fg:blue bg:bg bold)";
      };
      os = {
        disabled = false;
        style = "bg:blue";
        symbols = {
          Arch = "[  ](fg:bg $style)";
          NixOS = "[  ](fg:bg $style)";
          Macos = "[  ](fg:bg $style)";
          Void = "[  ](fg:bg bg:green)";
          Linux = "[  ](fg:bg $style)";
        };
      };
      nix_shell = {
        disabled = false;
        symbol = "";
        format = "[$state $symbol ](fg:blue bg:bg bold)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[ $duration](bg:bg fg:yellow bold)";
      };
      git_branch = {
        format = "[$branch $symbol (:$remote_branch)](fg:purple bg:bg bold)";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status ](fg:purple bg:bg bold))";
        stashed = " 󰿺";
        modified = " 󱞁";
        untracked = " 󱙓";
        deleted = " 󱙑";
        renamed = " 󱙓";
        staged = " 󰎜";
      };
      custom.nix = {
        command = "nix --version | awk '{ print $3 }'";
        detect_extensions = [ "nix" ];
        format = "[  $output](fg:blue)";
      };
      palettes.solarized = {
        fg = "#93a1a1";
        fg2 = "#839496";
        fg3 = "#657b83";
        fg4 = "#586e75";
        bg = "#282828";
        bg2 = "#073642";
        red = "#dc322f";
        green = "#b8bb26";
        blue = "#268bd2";
        cyan = "#2aa198";
        dark-cyan = "#2aa198";
        yellow = "#b58900";
        purple = "#6c71c4";
        magenta = "#d33682";
        brwhite = "#fbf1c7";
        white = "#eee8d5";
      };
      palettes.dynamic = {
        fg = "#${config.colorScheme.palette.base06}";
        bg = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base08}";
        yellow = "#${config.colorScheme.palette.base0A}";
        dark-yellow = "#${config.colorScheme.palette.base0A}";
        green = "#${config.colorScheme.palette.base0B}";
        dark-green = "#${config.colorScheme.palette.base0B}";
        cyan = "#${config.colorScheme.palette.base0C}";
        dark-cyan = "#${config.colorScheme.palette.base0C}";
        blue = "#${config.colorScheme.palette.base0D}";
        dark-blue = "#${config.colorScheme.palette.base0D}";
        magenta = "#${config.colorScheme.palette.base0E}";
        dark-magenta = "#${config.colorScheme.palette.base0E}";
        orange = "#${config.colorScheme.palette.base09}";
        gray = "#${config.colorScheme.palette.base03}";
        dark-gray = "#${config.colorScheme.palette.base02}";
      };
      palettes.gruvbox = {
        fg = "#ebdbb2";
        bg = "#1d2021";
        yellow = "#fabd2f";
        dark-yellow = "#d79921";
        green = "#b8bb26";
        dark-green = "#98971a";
        red = "#fb4932";
        dark-red = "#cc241d";
        magenta = "#d3869b";
        dark-magenta = "#b16286";
        blue = "#83a598";
        dark-blue = "#458588";
        cyan = "#8ec07c";
        dark-cyan = "#689d6a";
        gray = "#666666";
        dark-gray = "#3d3d3d";
      };
    };
  };
}
