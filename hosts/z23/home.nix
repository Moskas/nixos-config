{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ../../modules/newsboat.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    lazygit
    jq
    neofetch
    onefetch
    tickrs
    mpc-cli
    cava
    rnix-lsp
    nixfmt
    exa
    zip
    unzip
  ];

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
    autocd = false;
    defaultKeymap = "emacs";
    plugins = [ ];
    initExtra = "\n    export PATH=~/.config/emacs/bin:$PATH\n    ";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgsUnstable.starship;
    settings = {
      add_newline = false;
      palette = "solarized";
      format = lib.concatStrings [
        "$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$cmd_duration$fill$time$line_break$directory$sudo$character "
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[]( blue)";
        error_symbol = "[➜]( red)";
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
        style_user = "fg:bg bg:blue ";
        style_root = "fg:red bg:blue  italic";
        format = "[ $user ]($style)";
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "[ $hostname ]($style)";
        style = " fg:bg bg:red";
        disabled = false;
      };
      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = "  ";
        format = "[$symbol]($style)[$ram( | $swap) ]($style)";
        style = " fg:bg bg:green";
      };
      directory = {
        read_only = " ";
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
      git_branch = {
        format = "[ $symbol$branch(:$remote_branch) ](bg:purple fg:bg )";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status](bg:purple fg:bg ))";
        stashed = "📦";
        modified = "📝";
        staged = "+($count)";
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

  services.mpd = {
    enable = true;
    musicDirectory = "/home/moskas/Music";
    network = {
      listenAddress = "any";
      port = 6600;
    };
    extraConfig = ''
      audio_output {
      type  "pipewire"
      name  "pipewire"
      }
      audio_output {
      type    "fifo"
      name    "my_fifo"
      path    "/tmp/mpd.fifo"
      format  "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      #visualizer_type = "spectrum";
      visualizer_look = "+";
    };
  };

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
    };
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs:
      with epkgs; [
        vterm-toggle # Added as doom-emacs vterm won't compile due to read only directory
        elcord # Discord status
        transient
        mastodon
      ];
  };

  programs.neovim = {
    enable = true;
    coc = { enable = true; };
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      NeoSolarized
      vim-nix
      vim-airline
      vim-airline-themes
    ];
    extraConfig = ''
      colorscheme NeoSolarized
      nnoremap <esc> :noh<return><esc>
    '';
  };

  programs.btop = {
    enable = true;
    settings = { theme_background = false; };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      sub-langs = "all";
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
    };
  };

  programs.bat = {
    enable = true;
    config = {
      color = "always";
      pager = "less -FR";
    };
  };
}
