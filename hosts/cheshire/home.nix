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
    discord-screenaudio
    wineWowPackages.stable
    winetricks
    feh
    lutgen
    virt-manager

    gimp

    rates
    tickrs
    monero-gui

    # wayland testing
    waybar
    wl-gammactl
    wlsunset
    grim
    slurp
    wl-clipboard
    grimblast
    swww
    mako
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

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
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
      pinentry = "gnome3";
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
