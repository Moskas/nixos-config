{ config, pkgs, lib, username, e-mail, ... }:

{
  imports = [ ../../modules/git/git.nix ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [ onefetch neofetch btop exa lazygit ];

  programs.emacs = {
    enable = false; # fails to build on my wsl machine
    package = pkgs.emacs;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.starship;
    settings = {
      add_newline = false;
      palette = "gruvbox";
      format = lib.concatStrings [
        "$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$cmd_duration$fill$time$line_break$directory$sudo$character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[ ](blue)";
        error_symbol = "[ ](red)";
      };
      fill = { symbol = " "; };
      time = {
        disabled = false;
        format = "[ $time ]($style)";
        time_format = "%T";
        style = "fg:bg  bg:yellow";
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
      rust = {
        symbol = "🦀";
        format = "[ $symbol $version ](bg:yellow fg:bg )";
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
      nix_shell = {
        symbol = " ";
        format = "[$symbol](bold blue)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[ took $duration ](fg:bg bg:yellow)";
      };
      git_branch = {
        format = "[ $symbol$branch(:$remote_branch) ](bg:purple fg:bg )";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status ](bg:purple fg:bg ))";
        stashed = "📦";
        modified = "📝";
        staged = "+($count)";
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
        yellow = "#b58900";
        purple = "#6c71c4";
        magenta = "#d33682";
        brwhite = "#fbf1c7";
        white = "#eee8d5";
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

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa --grid --color always --icons --sort=type";
      ll = "exa --long --color always --icons --sort=type";
      la = "exa --grid --all --color auto --icons --sort=type";
      lla = "exa --long --all --color auto --icons --sort=type";
      e = "$EDITOR";
      en = "sudoedit /etc/nixos/configuration.nix";
      ehn = "$EDITOR ~/.config/nixpkgs/home.nix";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    #enableSyntaxHighlighting = true;
    autocd = false;
    defaultKeymap = "emacs";
    plugins = [ ];
    initExtra = "\n    export PATH=~/.config/emacs/bin:$PATH\n eval \"$(direnv hook zsh)\"   ";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
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
  # programs.home-manager.enable = true;
}
