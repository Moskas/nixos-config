{ config, pkgs, username, nix-colors, ... }:
let
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
    (callPackage ../../pkgs/osu-bin.nix { })
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
    size = 16;
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

  home.sessionVariables.GTK_THEME = "Gruvbox-Plus-Dark";

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
      pinentry = "gnome3";
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
}
