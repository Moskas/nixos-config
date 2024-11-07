{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      #palette = "dynamic";
      format = ''
        $directory$character
      '';
      right_format = ''
        $cmd_duration$nix_shell$rust$python$node$lua$git_status$git_state$git_branch$hostname
      '';
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
        ssh_symbol = "󰣀"; # 
        format = "[ $ssh_symbol $hostname ]($style)";
        style = " bg:bg fg:cyan bold";
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
        home_symbol = "~";
        truncation_length = 4;
        truncation_symbol = "./";
        truncate_to_repo = true;
        format = " [$path]($style)[$read_only]($read_only_style) ";
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
        format = "[ $symbol $version](fg:yellow bg:bg bold)";
      };
      python = {
        symbol = "";
        format = "[ $symbol $version](fg:yellow bg:bg bold)";
      };
      c = {
        symbol = "";
        detect_extensions = ''["c", "h", "cpp"]'';
      };
      lua = {
        symbol = "";
        format = "[ $symbol $version](fg:blue bg:bg bold)";
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
        format = "[$symbol shell](fg:blue bg:bg bold)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[ ⏱ $duration ](bg:bg fg:gray bold)";
      };
      git_branch = {
        format = "[ $branch $symbol(:$remote_branch)](fg:purple bg:bg bold)";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status](fg:purple bg:bg bold))";
        stashed = " 󰿺";
        modified = " 󱞁";
        untracked = " 󱙓";
        deleted = " 󱙑";
        renamed = " 󱙓";
        staged = " 󰎜";
      };
      command_timeout = 500;
      custom.nix = {
        command = "nix --version | awk '{ print $3 }'";
        detect_extensions = [ "nix" ];
        format = "[  $output](fg:blue)";
      };
      palettes.nixcolors = {
        fg = "#${config.colorScheme.palette.base06}";
        bg = "#${config.colorScheme.palette.base00}";
        red = "#${config.colorScheme.palette.base08}";
        yellow = "#${config.colorScheme.palette.base0A}";
        green = "#${config.colorScheme.palette.base0B}";
        cyan = "#${config.colorScheme.palette.base0C}";
        blue = "#${config.colorScheme.palette.base0D}";
        magenta = "#${config.colorScheme.palette.base0E}";
        orange = "#${config.colorScheme.palette.base09}";
        gray = "#${config.colorScheme.palette.base02}";
      };
    };
  };
}
