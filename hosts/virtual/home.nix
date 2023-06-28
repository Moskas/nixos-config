{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "moskas";
  home.homeDirectory = "/home/moskas";

  home.packages = with pkgs; [
    onefetch
    neofetch
    helix
    btop
    exa
    clojure
    clojure-lsp
    leiningen
    babashka
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa --grid --color always --icons --sort=type";
      ll = "exa --long --color always --icons --sort=type";
      la = "exa --grid --all --color always --icons --sort=type";
      lla = "exa --long --all --color always --icons --sort=type";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29;
    extraPackages = epkgs: with epkgs; [ vterm cider olivetti blamer ];
  };

  programs.git = {
    enable = true;
    userName = "Moskas";
    userEmail = "minemoskas@gmail.com";
    extraConfig = { init.defaultBranch = "master"; };
    aliases = {
      c = "clone";
      ci = "commit";
      co = "checkout";
      s = "status";
      a = "add";
      d = "diff";
      p = "push";
      pu = "pull";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.starship;
    settings = {
      add_newline = false;
      palette = "solarized";
      format = lib.concatStrings [
        "$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$cmd_duration$fill$time$line_break$nix_shell$directory$sudo$character "
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[]( fg:blue bold)";
        error_symbol = "[➜]( fg:red bold)";
      };
      fill = { symbol = " "; };
      time = {
        disabled = false;
        format = "[ $time ]($style)";
        time_format = "%T";
        style = "fg:bg  bg:yellow bold";
      };
      username = {
        disabled = false;
        style_user = "fg:bg bg:blue bold";
        style_root = "fg:red bg:blue  italic";
        format = "[ $user ]($style)";
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[ $hostname ]($style)";
        style = " fg:bg bg:red bold";
        disabled = false;
      };
      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = "  ";
        format = "[$symbol]($style)[$ram( | $swap) ]($style)";
        style = " fg:bg bg:green bold";
      };
      cmd_duration = { format = "[ $duration ](fg:bg bg:yellow bold)"; };
      directory = {
        read_only = " ";
        home_symbol = " ~";
        truncation_length = 4;
        truncation_symbol = "…/";
        truncate_to_repo = true;
      };
      rust = {
        symbol = "🦀";
        format = "[ $symbol $version ](bg:yellow fg:bg bold )";
      };
      python = { format = "[ $symbol $version ](bg:yellow fg:bg )"; };
      c = {
        symbol = " ";
        detect_extensions = ''["c", "h", "cpp"]'';
      };
      os = {
        disabled = false;
        style = "bg:blue";
        symbols = {
          Arch = "[  ](fg:bg $style)";
          NixOS = "[  ](fg:bg $style)";
          Macos = "[  ](fg:red $style)";
          Linux = "[  ](fg:fg $style)";
        };
      };
      git_branch = {
        format = "[ $symbol$branch(:$remote_branch) ](bg:purple fg:bg bold)";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status ](bg:purple fg:bg bold))";
        stashed = "📦";
        modified = "📝";
        staged = "+($count)";
      };
      nix_shell = {
        format = "[ $symbol$state ](bg:blue fg:bg) ";
        symbol = "";
      };
      palettes.solarized = {
        fg = "#93a1a1";
        fg2 = "#839496";
        fg3 = "#657b83";
        fg4 = "#586e75";
        bg = "#002b36";
        bg2 = "#073642";
        red = "#dc322f";
        green = "#859900";
        blue = "#268bd2";
        cyan = "#2aa198";
        yellow = "#b58900";
        purple = "#6c71c4";
        magenta = "#d33682";
        brwhite = "#fdf6e3"; # "white" according to wikipedia lol
        white = "#eee8d5";
      };
    };
  };
  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 4
      font_family FiraCode Nerd Font
      bold_font auto
      italic_font auto
      bold_italic_font  auto
      font_size 12
      disable_ligatures never

      tab_bar_edge bottom
      tab_bar_style powerline
      tab_powerline_style slanted
      active_tab_foreground   #e9e2cb
      active_tab_background   #002731
      active_tab_font_style   bold-italic
      inactive_tab_foreground #708183
      inactive_tab_background #001e26
      inactive_tab_font_style normal
      cursor  #2075c7
      confirm_os_window_close 0
      background #001e26
      foreground #708183
      cursor #708183
      selection_background #002731
      color0 #002731
      color1 #d01b24
      color2 #728905
      color3 #a57705
      color4 #2075c7
      color5 #c61b6e
      color6 #259185
      color7 #e9e2cb
      color8 #001e26
      color9 #bd3612
      color10 #465a61
      color11 #52676f
      color12 #708183
      color13 #5856b9
      color14 #81908f
      color15 #fcf4dc
      selection_foreground #001e26
    '';
  };

  programs.zathura = {
    enable = true;
    options = {
      notification-error-bg = "#586e75"; # base01
      notification-error-fg = "#dc322f"; # red
      notification-warning-bg = "#586e75"; # base01
      notification-warning-fg = "#dc322f"; # red
      notification-bg = "#586e75"; # base01
      notification-fg = "#b58900"; # yellow
      completion-group-bg = "#002b36"; # base03
      completion-group-fg = "#839496"; # base0
      completion-bg = "#073642"; # base02
      completion-fg = "#93a1a1"; # base1
      completion-highlight-bg = "#586e75"; # base01
      completion-highlight-fg = "#eee8d5"; # base2
      index-bg = "#073642"; # base02
      index-fg = "#93a1a1"; # base1
      index-active-bg = "#586e75"; # base01
      index-active-fg = "#eee8d5"; # base2
      inputbar-bg = "#586e75"; # base01
      inputbar-fg = "#eee8d5"; # base2
      statusbar-bg = "#073642"; # base02
      statusbar-fg = "#93a1a1"; # base1
      highlight-color = "#657b83"; # base00
      highlight-active-color = "#268bd2"; # blue
      default-bg = "#073642"; # base02
      default-fg = "#93a1a1"; # base1
      recolor = true;
      recolor-lightcolor = "#073642"; # base02
      recolor-darkcolor = "#93a1a1"; # base1
    };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (dark)";
      color = "always";
      pager = "less -FR";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
