{ config, pkgs, lib, username, nix-colors, ... }:
let
  # osu-lazer-bin = pkgs.osu-lazer-bin.overrideAttrs (oldAttrs: rec {
  #   pname = "osu-lazer-bin";
  #   version = "2023.1008.0";
  #   name = "osu-lazer-bin-2023.1008.0";
  #   osu-lazer-bin-src = {
  #     x86_64-linux = {
  #       url =
  #         "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
  #       sha256 = "sha256-18lajjn7asdvfby67sjz4w3pbfndvqz7hjsb6s0ql2w2jz0x3439=";
  #     };
  #   };
  # }); # Keeping that as a note to self if I ever need to override some package
  #random-character = import ../../modules/scripts/random-character.nix { inherit pkgs; };
  random-wallpaper =
    import ../../modules/scripts/random-wallpaper.nix { inherit pkgs; };
in {
  imports = [
    nix-colors.homeManagerModules.default
    ./wallpapers.nix
    ../../modules/browsers
    ../../modules/apps
    ../../modules/git
    ../../modules/media
    ../../modules/editors
    ../../modules/shell
    ../../modules/email
    ../../modules/services
    ../../modules/desktops/qtilestyle.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

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
    nvtop
    manga-cli
    ani-cli
    python311Packages.aria2p # aria2c
    python311Packages.mpd2
    ffmpeg
    mpc-cli
    cava
    cargo
    rnix-lsp
    nixfmt
    betterdiscordctl
    protonup-ng
    #heroic
    steam-run
    protontricks
    bottles
    mangohud
    goverlay
    prismlauncher
    yuzu
    jre8
    ferium
    nsxiv
    i2c-tools
    betterlockscreen
    libnotify
    pulsemixer
    bitwarden
    easyeffects
    xclip
    pkg-config
    osu-lazer-bin
    obsidian
    openrgb-with-all-plugins
    distrobox
    nicotine-plus
    (makeDesktopItem {
      name = "brave-private";
      desktopName = "Brave Web Browser";
      genericName = "Open a private Brave window";
      icon = "brave";
      exec = "${brave}/bin/brave --incognito";
      categories = [ "Network" ];
    })
    random-wallpaper
    obs-studio
    discord
    wineWowPackages.stable
    winetricks
    feh
    lutgen
    virt-manager

    rates
    tickrs
    monero-gui

    # wayland testing
    #waybar
    #wl-gammactl
    #wlsunset
    #swww
    #mako
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  #home.file = {
  #  ".config/qtile".source = pkgs.fetchFromGitHub {
  #    owner = "${Username}";
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

  programs.pandoc = { enable = true; };

  programs.gpg = { enable = true; };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    pinentryFlavor = "tty";
  };

  #  programs.kitty = {
  #    enable = true;
  #    extraConfig = ''
  #      window_padding_width 5
  #      font_family JetBrainsMono Nerd Font
  #      bold_font auto
  #      italic_font auto
  #      bold_italic_font  auto
  #      font_size 12
  #      disable_ligatures never
  #
  #      tab_bar_edge bottom
  #      tab_bar_style powerline
  #      tab_powerline_style slanted
  #      active_tab_font_style   bold-italic
  #      inactive_tab_font_style normal
  #      confirm_os_window_close 0
  #      cursor                  #928374
  #      cursor_text_color       background
  #
  #      url_color               #83a598
  #
  #      visual_bell_color       #8ec07c
  #      bell_border_color       #8ec07c
  #
  #      active_border_color     #d3869b
  #      inactive_border_color   #665c54
  #
  #      foreground              #${config.colorScheme.colors.base06}
  #      background              #${config.colorScheme.colors.base00}
  #      selection_foreground    #928374
  #      selection_background    #${config.colorScheme.colors.base06}
  #
  #      active_tab_foreground   #fbf1c7
  #      active_tab_background   #665c54
  #      inactive_tab_foreground #a89984
  #      inactive_tab_background #3c3836
  #
  #      # black  (bg3/bg4)
  #      color0                  #665c54
  #      color8                  #7c6f64
  #
  #      # red
  #      color1                  #cc241d
  #      color9                  #fb4934
  #
  #      #: green
  #      color2                  #98971a
  #      color10                 #b8bb26
  #
  #      # yellow
  #      color3                  #d79921
  #      color11                 #fabd2f
  #
  #      # blue
  #      color4                  #458588
  #      color12                 #83a598
  #
  #      # purple
  #      color5                  #b16286
  #      color13                 #d3869b
  #
  #      # aqua
  #      color6                  #689d6a
  #      color14                 #8ec07c
  #
  #      # white (fg4/fg3)
  #      color7                  #a89984
  #      color15                 #bdae93
  #      selection_foreground    #fbf1c7
  #    '';
  #  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "oomox-gruvbox-dark";
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

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.sessionVariables.GTK_THEME = "Gruvbox-Dark-BL";

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
    };
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

  #  programs.zathura = {
  #    enable = true;
  #    options = {
  #      notification-error-bg = "#32302f"; # bg
  #      notification-error-fg = "#fb4934"; # bright:red
  #      notification-warning-bg = "#32302f"; # bg
  #      notification-warning-fg = "#fabd2f"; # bright:yellow
  #      notification-bg = "#32302f"; # bg
  #      notification-fg = "#b8bb26"; # bright:green
  #
  #      completion-bg = "#504945"; # bg2
  #      completion-fg = "#ebdbb2"; # fg
  #      completion-group-bg = "#3c3836"; # bg1
  #      completion-group-fg = "#928374"; # gray
  #      completion-highlight-bg = "#83a598"; # bright:blue
  #      completion-highlight-fg = "#504945"; # bg2
  #
  #      # Define the color in index mode
  #      index-bg = "#504945"; # bg2
  #      index-fg = "#ebdbb2"; # fg
  #      index-active-bg = "#83a598"; # bright:blue
  #      index-active-fg = "#504945"; # bg2
  #
  #      inputbar-bg = "#32302f"; # bg
  #      inputbar-fg = "#ebdbb2"; # fg
  #
  #      statusbar-bg = "#504945"; # bg2
  #      statusbar-fg = "#ebdbb2"; # fg
  #
  #      highlight-color = "#fabd2f"; # bright:yellow
  #      highlight-active-color = "#fe8019"; # bright:orange
  #
  #      default-bg = "#32302f"; # bg
  #      default-fg = "#ebdbb2"; # fg
  #      render-loading = true;
  #      render-loading-bg = "#32302f"; # bg
  #      render-loading-fg = "#ebdbb2"; # fg
  #
  #      # Recolor book content's color
  #      recolor-lightcolor = "#32302f"; # bg
  #      recolor-darkcolor = "#ebdbb2"; # fg
  #      recolor = true;
  #      recolor-keephue = true; # keep original color
  #    };
  #  };
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
}
