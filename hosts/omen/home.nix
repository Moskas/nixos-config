{ config, pkgs, lib, ... }:

{
  imports = [
    ./wallpapers.nix
    ../../modules/newsboat.nix
    ../../modules/firefox.nix
    ../../modules/mpv/mpv.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "moskas";
  home.homeDirectory = "/home/moskas";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    lazygit
    jq
    trackma
    manga-cli
    ani-cli
    python310Packages.aria2p # aria2c
    python310Packages.mpd2
    ranger
    ffmpeg
    duf
    du-dust
    neofetch
    onefetch
    tickrs
    spotify
    mpc-cli
    cava
    rnix-lsp
    nixfmt
    betterdiscordctl
    steam
    protonup-ng
    heroic
    bottles
    mangohud
    goverlay
    prismlauncher
    jre8
    ferium
    feh
    sxiv
    openrgb
    i2c-tools
    betterlockscreen
    dunst
    libnotify
    pulsemixer
    bitwarden
    pinentry
    easyeffects
    exa
    xclip
    zip
    unzip
    html-tidy
    nodePackages_latest.prettier
    pkg-config
    osu-lazer
    epr
    direnv
  ];

  xresources = {
    path = "$HOME/.Xresources";
    extraConfig = ''
      builtins.readFile
        (
          pkgs.fetchFromGitHub
            {
              owner = "solarized";
              repo = "xresources";
              rev = "025ceddbddf55f2eb4ab40b05889148aab9699fc";
              sha256 = "0lxv37gmh38y9d3l8nbnsm1mskcv10g3i83j0kac0a2qmypv1k9f";
            } + "/Xresources.dark"
        )'';
  };

  home.file = {
    ".config/qtile".source = pkgs.fetchFromGitea {
      domain = "codeberg.org";
      owner = "Moskas";
      repo = "qtile-org";
      rev = "d293ab37d6";
      sha256 = "sha256-9wEoLw3/ma1mvt2Jj2xPc6LejP2HIpBzqxQ+h7E50t8=";
    };
  };

  home.pointerCursor = {
    size = 64;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };

  programs.pandoc = { enable = true; };

  programs.brave = {
    enable = true;
    extensions = [
      {
        id = "dcpihecpambacapedldabdbpakmachpb";
        updateUrl =
          "https://raw.githubusercontent.com/iamadamdev/bypass-paywalls-chrome/master/updates.xml";
      }
      {
        id = "nngceckbapebfimnlniiiahkandclblb"; # bitwarden
      }
      {
        id = "ajopnjidmegmdimjlfnijceegpefgped"; # BTTV
      }
      {
        id = "fadndhdgpmmaapbmfcknlfgcflmmmieb"; # FFZ
      }
      {
        id = "aalmjfpohaedoddkobnibokclgeefamn"; # Gumbo: Twitch Companion
      }
    ];
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

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
    settings = {
      git_protocol = "ssh";

      prompt = "enabled";

      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

  programs.gpg = { enable = true; };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    pinentryFlavor = "tty";
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
    initExtra =
      "\n    export PATH=~/.config/emacs/bin:$PATH\n export PATH=~/.local/share/applications/:$PATH\n eval \"$(direnv hook zsh)\"   ";
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.starship;
    settings = {
      add_newline = false;
      palette = "solarized";
      format = lib.concatStrings [
        "$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$cmd_duration$fill$time$line_break$directory$sudo$character "
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[ ]( blue)";
        error_symbol = "[ ]( red)";
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
        format = "([ $all_status ](bg:purple fg:bg ))";
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

  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 4
      font_family FiraCode Nerd Font
      bold_font auto
      italic_font auto
      bold_italic_font  auto
      font_size 14
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

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        max_icon_size = 64;
        min_icon_size = 32;
        frame_color = "#458588";
        font = "JetBrainsMono Nerd Font 9";
        format = ''
          <b>%s</b>
          %b'';
        show_indicators = false;
      };

      urgency_normal = {
        background = "#002b36";
        foreground = "#839496";
        timeout = 10;
      };

      discord = {
        appname = "discord";
        frame_color = "#5856b9";
      };

      spotify = {
        appname = ".spotify";
        urgency = "Normal";
        frame_color = "#5856b9";
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
      name  "My Pipewire"
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

  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      hosts = [ "localhost:6600" ];
      format = {
        details = "$title";
        state = "On $album by $artist";
      };
    };
  };
  services.redshift = {
    enable = true;
    provider = "manual";
    latitude = 52.2297;
    longitude = 21.0122;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Numix";
      package = pkgs.numix-solarized-gtk-theme;
    };
  };

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        autoCloseIdleDaemon = true;
        checkForUpdates = false;
        contrastOpacity = 188;
        saveAfterCopy = true;
        savePath = "/home/moskas/Pictures/Screenshots";
        savePathFixed = true;
        uiColor = "#2075c7";
        useJpgForClipboard = false;
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };
  };

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    opacityRules = [
      "80:class_g = 'kitty' && !focused"
      "90:class_g = 'kitty' && focused"
      "95:class_g = 'Emacs' && !focused"
      "98:class_g = 'Emacs' && focused"
      "95:class_g = 'Zathura' && !focused"
      "98:class_g = 'Zathura' && focused"
      "95:class_g = 'discord' && !focused"
      "98:class_g = 'discord' && focused"
      "95:class_g = 'qutebrowser' && !focused"
    ];
    settings = { blur = { method = "dual_kawase"; }; };
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
    package = pkgs.emacs29;
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

  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      nw = "https://nixos.wiki/index.php?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      b = "https://www.search.brave.com/search?q={}";
      s = "https://startpage.com/search?q={}";
    };
    settings = {
      statusbar.show = "in-mode";
      #content.user_styles = "solarized.css";
      downloads.position = "bottom";
      tabs = {
        show = "multiple";
        show_switching_delay = 1500;
        background = true;
        title.format = "{audio}{current_title}";
      };
      scrolling.smooth = true;
      fonts = {
        prompts = "12pt JetBrainsMono Nerd Font";
        hints = "10pt JetBrainsMono Nerd Font";
        statusbar = "12pt JetBrainsMono Nerd Font";
        contextmenu = "10pt JetBrainsMono Nerd Font";
        completion = {
          entry = "12pt JetBrainsMono Nerd Font";
          category = "12pt JetBrainsMono Nerd Font";
        };
        web = {
          size.default = 16;
          family = {
            standard = "JetBrainsMono Nerd Font";
            sans_serif = "JetBrainsMono Nerd Font";
            fixed = "JetBrainsMono Nerd Font";
            cursive = "JetBrainsMono Nerd Font";
            fantasy = "JetBrainsMono Nerd Font";
          };
        };
        tabs = {
          selected = "10pt JetBrainsMono Nerd Font";
          unselected = "10pt JetBrainsMono Nerd Font";
        };
      };
      url = { start_pages = "https://www.google.com"; };
      content.blocking.whitelist =
        [ "*://xeiaso.net/*" "*://ethicalads.io/*" "*://*.ethicalads.io/*" ];
      colors = {
        statusbar = {
          normal = {
            bg = "#002b36";
            fg = "#fdf6e3";
          };
          command = {
            bg = "#002b36";
            fg = "#fdf6e3";
          };
          insert = {
            bg = "#002b36";
            fg = "#859900";
          };
          url = {
            success.http.fg = "#859900";
            success.https.fg = "#859900";
          };
        };
        tabs = {
          indicator.stop = "#93a1a1";
          odd.bg = "#002b36";
          even.bg = "#073642";
          selected = {
            odd.bg = "#002b36";
            even.bg = "#073642";
          };
        };
        hints = {
          bg = "#002b36";
          fg = "#fdf6e3";
          match.fg = "#859900";
        };
        completion = {
          fg = "#fdf6e3";
          odd.bg = "#002b36";
          even.bg = "#073642";
          category = {
            bg = "#002b36";
            fg = "#fdf6e3";
          };
          item.selected = {
            bg = "#002b36";
            fg = "#fdf6e3";
            match.fg = "#859900";
          };
          match = { fg = "#fdf6e3"; };
          scrollbar = {
            fg = "#073642";
            bg = "#002b36";
          };
        };
        webpage = {
          bg = "#fdf6e3";
          preferred_color_scheme = "dark";
          darkmode.enabled = false;
          darkmode.policy.images = "never";
        };
        downloads = {
          bar.bg = "#002b36";
          error = {
            fg = "#fdf6e3";
            bg = "#cc241d";
          };
          start = {
            fg = "#fdf6e3";
            bg = "#d79921";
          };
          stop = {
            fg = "#fdf6e3";
            bg = "#859900";
          };
        };
        prompts = {
          fg = "#fdf6e3";
          bg = "#002b36";
        };
        keyhint = {
          fg = "#fdf6e3";
          bg = "#002b36";
          suffix.fg = "#859900";
        };
      };
    };
    keyBindings = {
      normal = {
        "<Ctrl-v>" = "spawn mpv {url}";
        ",p" = "spawn --userscript qute-bitwarden";
        ",u" = "adblock-update";
        ",l" =
          ''config-cycle spellcheck.languages ["en-GB"] ["en-US"] ["pl-PL"]'';
        "Wd" =
          "hint links spawn kitty -e yt-dlp {hint-url}"; # make it more terminal agnostic
        "W" = "hint links spawn --detach mpv {hint-url}";
        "q" = "tab-close";
      };
      prompt = { "<Ctrl-y>" = "prompt-yes"; };
    };
    extraConfig = "config.unbind('d')";
  };

  programs.rofi = {
    enable = true;
    font = "FiraCode Nerd Font 12";
    extraConfig = {
      modi = "drun";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
    };
    location = "top-left";
    plugins = with pkgs; [ rofimoji rofi-power-menu rofi-bluetooth ];
    theme = "${pkgs.rofi}/share/rofi/themes/solarized_alternate.rasi";
    terminal = "${pkgs.kitty}/bin/kitty";
  };

  services.easyeffects = {
    enable = true;
    preset = "Bass";
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "solarized_dark";
      theme_background = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
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
      theme = "Solarized (dark)";
      color = "always";
      pager = "less -FR";
    };
  };
}
