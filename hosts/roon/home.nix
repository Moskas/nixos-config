{ config, pkgs, lib, e-mail, username, nix-colors, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
    ./wallpapers.nix
    ./gtk.nix
    ../../modules/shell
    ../../modules/browsers
    ../../modules/media
    ../../modules/apps
    ../../modules/git
    ../../modules/services
    ../../modules/editors/vscode.nix
  ];

  colorScheme = nix-colors.colorSchemes.solarized-dark;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

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
    manga-cli
    ani-cli
    python311Packages.aria2p # aria2c
    python311Packages.mpd2
    ffmpeg
    mpc-cli
    tickrs
    cava
    rnix-lsp
    nixfmt
    betterdiscordctl
    discord
    steam
    protonup-ng
    #heroic
    #bottles
    mangohud
    goverlay
    prismlauncher
    jre8
    ferium
    feh
    nsxiv
    openrgb
    i2c-tools
    betterlockscreen
    libnotify
    pulsemixer
    bitwarden
    #pinentry
    easyeffects
    xclip
    html-tidy
    nodePackages_latest.prettier
    pkg-config
    osu-lazer-bin
    epr
    direnv
    lutgen
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
  #  ".config/qtile".source = pkgs.fetchFromGitea {
  #    domain = "codeberg.org";
  #    owner = "Moskas";
  #    repo = "qtile-org";
  #    rev = "d293ab37d6";
  #    sha256 = "sha256-9wEoLw3/ma1mvt2Jj2xPc6LejP2HIpBzqxQ+h7E50t8=";
  #  };
  #};

  home.pointerCursor = {
    size = 64;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };

  programs.pandoc = { enable = true; };

  programs.gpg = { enable = true; };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    pinentryFlavor = "tty";
  };

  #programs.zsh = {
  #  enable = true;
  #  shellAliases = {
  #    ls = "exa --grid --color always --icons --sort=type";
  #    ll = "exa --long --color always --icons --sort=type";
  #    la = "exa --grid --all --color auto --icons --sort=type";
  #    lla = "exa --long --all --color auto --icons --sort=type";
  #    e = "$EDITOR";
  #    en = "sudoedit /etc/nixos/configuration.nix";
  #    ehn = "$EDITOR ~/.config/nixpkgs/home.nix";
  #    update = "sudo nixos-rebuild switch";
  #  };
  #  history = {
  #    size = 10000;
  #    path = "${config.xdg.dataHome}/zsh/history";
  #  };
  #  enableAutosuggestions = true;
  #  syntaxHighlighting.enable = true;
  #  autocd = false;
  #  defaultKeymap = "emacs";
  #  plugins = [ ];
  #  initExtra =
  #    "\n    export PATH=~/.config/emacs/bin:$PATH\n export PATH=~/.local/share/applications/:$PATH\n eval \"$(direnv hook zsh)\"   ";
  #};
  programs.starship = {
    #enable = true;
    #enableZshIntegration = true;
    #package = pkgs.starship;
    settings = {
      #add_newline = false;
      palette = lib.mkForce "solarized";
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

  #  gtk = {
  #    enable = true;
  #    theme = {
  #      name = "Numix";
  #      package = pkgs.numix-solarized-gtk-theme;
  #    };
  #  };

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
      pinentry = "tty";
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

  #programs.qutebrowser = {
  #  enable = true;
  #  searchEngines = {
  #    w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
  #    aw = "https://wiki.archlinux.org/?search={}";
  #    nw = "https://nixos.wiki/index.php?search={}";
  #    g = "https://www.google.com/search?hl=en&q={}";
  #    b = "https://www.search.brave.com/search?q={}";
  #    s = "https://startpage.com/search?q={}";
  #  };
  #  settings = {
  #    statusbar.show = "in-mode";
  #    #content.user_styles = "solarized.css";
  #    downloads.position = "bottom";
  #    tabs = {
  #      show = "multiple";
  #      show_switching_delay = 1500;
  #      background = true;
  #      title.format = "{audio}{current_title}";
  #    };
  #    scrolling.smooth = true;
  #    fonts = {
  #      prompts = "12pt JetBrainsMono Nerd Font";
  #      hints = "10pt JetBrainsMono Nerd Font";
  #      statusbar = "12pt JetBrainsMono Nerd Font";
  #      contextmenu = "10pt JetBrainsMono Nerd Font";
  #      completion = {
  #        entry = "12pt JetBrainsMono Nerd Font";
  #        category = "12pt JetBrainsMono Nerd Font";
  #      };
  #      web = {
  #        size.default = 16;
  #        family = {
  #          standard = "JetBrainsMono Nerd Font";
  #          sans_serif = "JetBrainsMono Nerd Font";
  #          fixed = "JetBrainsMono Nerd Font";
  #          cursive = "JetBrainsMono Nerd Font";
  #          fantasy = "JetBrainsMono Nerd Font";
  #        };
  #      };
  #      tabs = {
  #        selected = "10pt JetBrainsMono Nerd Font";
  #        unselected = "10pt JetBrainsMono Nerd Font";
  #      };
  #    };
  #    url = { start_pages = "https://www.google.com"; };
  #    content.blocking.whitelist =
  #      [ "*://xeiaso.net/*" "*://ethicalads.io/*" "*://*.ethicalads.io/*" ];
  #    colors = {
  #      statusbar = {
  #        normal = {
  #          bg = "#002b36";
  #          fg = "#fdf6e3";
  #        };
  #        command = {
  #          bg = "#002b36";
  #          fg = "#fdf6e3";
  #        };
  #        insert = {
  #          bg = "#002b36";
  #          fg = "#859900";
  #        };
  #        url = {
  #          success.http.fg = "#859900";
  #          success.https.fg = "#859900";
  #        };
  #      };
  #      tabs = {
  #        indicator.stop = "#93a1a1";
  #        odd.bg = "#002b36";
  #        even.bg = "#073642";
  #        selected = {
  #          odd.bg = "#002b36";
  #          even.bg = "#073642";
  #        };
  #      };
  #      hints = {
  #        bg = "#002b36";
  #        fg = "#fdf6e3";
  #        match.fg = "#859900";
  #      };
  #      completion = {
  #        fg = "#fdf6e3";
  #        odd.bg = "#002b36";
  #        even.bg = "#073642";
  #        category = {
  #          bg = "#002b36";
  #          fg = "#fdf6e3";
  #        };
  #        item.selected = {
  #          bg = "#002b36";
  #          fg = "#fdf6e3";
  #          match.fg = "#859900";
  #        };
  #        match = { fg = "#fdf6e3"; };
  #        scrollbar = {
  #          fg = "#073642";
  #          bg = "#002b36";
  #        };
  #      };
  #      webpage = {
  #        bg = "#fdf6e3";
  #        preferred_color_scheme = "dark";
  #        darkmode.enabled = false;
  #        darkmode.policy.images = "never";
  #      };
  #      downloads = {
  #        bar.bg = "#002b36";
  #        error = {
  #          fg = "#fdf6e3";
  #          bg = "#cc241d";
  #        };
  #        start = {
  #          fg = "#fdf6e3";
  #          bg = "#d79921";
  #        };
  #        stop = {
  #          fg = "#fdf6e3";
  #          bg = "#859900";
  #        };
  #      };
  #      prompts = {
  #        fg = "#fdf6e3";
  #        bg = "#002b36";
  #      };
  #      keyhint = {
  #        fg = "#fdf6e3";
  #        bg = "#002b36";
  #        suffix.fg = "#859900";
  #      };
  #    };
  #  };
  #  keyBindings = {
  #    normal = {
  #      "<Ctrl-v>" = "spawn mpv {url}";
  #      ",p" = "spawn --userscript qute-bitwarden";
  #      ",u" = "adblock-update";
  #      ",l" =
  #        ''config-cycle spellcheck.languages ["en-GB"] ["en-US"] ["pl-PL"]'';
  #      "Wd" =
  #        "hint links spawn kitty -e yt-dlp {hint-url}"; # make it more terminal agnostic
  #      "W" = "hint links spawn --detach mpv {hint-url}";
  #      "q" = "tab-close";
  #    };
  #    prompt = { "<Ctrl-y>" = "prompt-yes"; };
  #  };
  #  extraConfig = "config.unbind('d')";
  #};

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
    theme = "${pkgs.rofi}/share/rofi/themes/solarized_alternate.rasi";
    terminal = "${pkgs.kitty}/bin/kitty";
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "solarized_dark";
      theme_background = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  #programs.zathura = {
  #  enable = true;
  #  options = {
  #    notification-error-bg = "#586e75"; # base01
  #    notification-error-fg = "#dc322f"; # red
  #    notification-warning-bg = "#586e75"; # base01
  #    notification-warning-fg = "#dc322f"; # red
  #    notification-bg = "#586e75"; # base01
  #    notification-fg = "#b58900"; # yellow
  #    completion-group-bg = "#002b36"; # base03
  #    completion-group-fg = "#839496"; # base0
  #    completion-bg = "#073642"; # base02
  #    completion-fg = "#93a1a1"; # base1
  #    completion-highlight-bg = "#586e75"; # base01
  #    completion-highlight-fg = "#eee8d5"; # base2
  #    index-bg = "#073642"; # base02
  #    index-fg = "#93a1a1"; # base1
  #    index-active-bg = "#586e75"; # base01
  #    index-active-fg = "#eee8d5"; # base2
  #    inputbar-bg = "#586e75"; # base01
  #    inputbar-fg = "#eee8d5"; # base2
  #    statusbar-bg = "#073642"; # base02
  #    statusbar-fg = "#93a1a1"; # base1
  #    highlight-color = "#657b83"; # base00
  #    highlight-active-color = "#268bd2"; # blue
  #    default-bg = "#073642"; # base02
  #    default-fg = "#93a1a1"; # base1
  #    recolor = true;
  #    recolor-lightcolor = "#073642"; # base02
  #    recolor-darkcolor = "#93a1a1"; # base1
  #  };
  #};
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
      theme = lib.mkForce "Solarized (dark)";
      color = "always";
      pager = "less -FR";
    };
  };
}
