{ config, pkgs, lib, ... }:

{
  imports = [ ./wallpapers.nix ];

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
    i2c-tools
    betterlockscreen
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
    openrgb-with-all-plugins
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

  #home.file = {
  #  ".config/qtile".source = pkgs.fetchFromGitHub {
  #    owner = "Moskas";
  #    repo = "qtile-config";
  #    rev = "3e5fa15950985fdb508fe2056f498c83927dc7dc";
  #    sha256 = "sha256-9wEoLw3/ma1mvt2Jj2xPc6LejP2HIpBzqxQ+h7E50t8=";
  #  };
  #};

  home.pointerCursor = {
    size = 64;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };

  programs.firefox = {
    enable = true;
    profiles.moskas = {
      name = "Moskas";
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
        "browser.search.region" = "PL";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "pl-PL";
        "general.useragent.locale" = "pl-PL";
        "browser.bookmarks.showMobileBookmarks" = true;
      };
      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #  darkreader
      #  stylus
      #  vimium
      #  bitwarden
      #  betterttv
      #  sponsorblock
      #  return-youtube-dislikes
      #];
    };

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
    initExtra = "\n    export PATH=~/.config/emacs/bin:$PATH\n    ";
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
        brwhite = "#fdf6e3";
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

  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 4
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
      cursor                  #928374
      cursor_text_color       background

      url_color               #83a598

      visual_bell_color       #8ec07c
      bell_border_color       #8ec07c

      active_border_color     #d3869b
      inactive_border_color   #665c54

      foreground              #ebdbb2
      background              #282828
      selection_foreground    #928374
      selection_background    #ebdbb2

      active_tab_foreground   #fbf1c7
      active_tab_background   #665c54
      inactive_tab_foreground #a89984
      inactive_tab_background #3c3836

      # black  (bg3/bg4)
      color0                  #665c54
      color8                  #7c6f64

      # red
      color1                  #cc241d
      color9                  #fb4934

      #: green
      color2                  #98971a
      color10                 #b8bb26

      # yellow
      color3                  #d79921
      color11                 #fabd2f

      # blue
      color4                  #458588
      color12                 #83a598

      # purple
      color5                  #b16286
      color13                 #d3869b

      # aqua
      color6                  #689d6a
      color14                 #8ec07c

      # white (fg4/fg3)
      color7                  #a89984
      color15                 #bdae93
      selection_foreground    #fbf1c7
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
        frame_color = "#3c3836";
        font = "JetBrainsMono Nerd Font 9";
        format = ''
          <b>%s</b>
          %b'';
        show_indicators = false;
      };

      urgency_normal = {
        background = "#282828";
        foreground = "#fbf1c7";
        timeout = 10;
      };

      discord = {
        appname = "discord";
        frame_color = "#d3869b";
      };

      spotify = {
        appname = ".spotify";
        urgency = "Normal";
        frame_color = "#d3869b";
      };
    };
  };

  programs.mpv = {
    enable = true;
    config = {
      #ytdl-format = "bestvideo+bestaudio";
      keepaspect = false;
    };
    scripts = with pkgs; [ mpvScripts.sponsorblock mpvScripts.youtube-quality ];
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
      name = "gruvbox-dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "gruvbox-dark";

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
      vim-nix
      vim-airline
      vim-airline-themes
    ];
    extraConfig = ''
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
      #s = "https://startpage.com/search"; # check API?
    };
    settings = {
      statusbar.show = "in-mode";
      downloads.position = "bottom";
      content.user_stylesheets = "solarized.css";
      tabs = {
        show = "switching";
        show_switching_delay = 1500;
        background = true;
        title.format = "{audio}{current_title}";
      };
      fonts = {
        prompts = "12pt FiraCode Nerd Font";
        statusbar = "12pt FiraCode Nerd Font";
        completion.entry = "12pt FiraCode Nerd Font";
      };
      url = {
        start_pages = "https://www.google.com";
        #searchengines = "https://google.com/search?hl=en&q={}";
      };
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
          bg = "#002b36";
          darkmode.enabled = true;
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

  programs.newsboat = {
    enable = true;
    browser = "qutebrowser";
    autoReload = true;
    urls = [
      {
        tags = [ "linux" ];
        url = "https://www.phoronix.com/rss.php";
      }
      {
        tags = [ "games" ];
        url = "https://terrysfreegameoftheweek.com/feed/";
      }
      {
        tags = [ "linux" "tech" ];
        url = "https://myme.no/feed.xml";
      }
      {
        tags = [ "media" ];
        url =
          "https://pipedapi.kavin.rocks/feed/rss?authToken=5f754893-4492-46a1-8d5a-bfbeb8def939";
      }
      {
        tags = [ "Youtube" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw";
      }
    ];
    extraConfig = ''
      color background color0 color0
      macro v set browser "setsid -f mpv --really-quiet --no-terminal" ; open-in-browser ; set browser brave'';
  };

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
    theme = "${pkgs.rofi}/share/rofi/themes/gruvbox-dark-hard.rasi";
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
