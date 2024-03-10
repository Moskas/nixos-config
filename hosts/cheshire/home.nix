{ config, pkgs, username, nix-colors, nur, inputs, ... }:
let
  random-wallpaper =
    import ../../modules/scripts/random-wallpaper.nix { inherit pkgs config; };
in {
  imports = [
    nix-colors.homeManagerModules.default
    nur.nixosModules.nur
    ./wallpapers.nix
    ../../modules/browsers
    ../../modules/apps
    ../../modules/apps/gaming
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
    ffmpeg
    cava
    cargo
    betterdiscordctl
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
    random-wallpaper
    obs-studio
    discord
    discord-screenaudio
    wineWowPackages.stable
    winetricks
    feh
    lutgen
    gradience

    gimp
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

  home.file = { ".config/test".source = inputs.qtile-config; };

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
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

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
    enable = false;
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
