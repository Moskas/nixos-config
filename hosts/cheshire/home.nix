{
  config,
  pkgs,
  username,
  nix-colors,
  nur,
  inputs,
  ...
}:
let
  random-wallpaper = import ../../modules/scripts/random-wallpaper.nix { inherit pkgs config; };
in
{
  imports = [
    nix-colors.homeManagerModules.default
    nur.nixosModules.nur
    ../../modules/common/home
    #../../modules/desktops/theming/gtk.nix # TODO Look for some improvements as GTK4/Libadwaita looks horrible
    ../../modules/browsers
    #../../modules/browsers/nyxt.nix
    ../../modules/apps
    ../../modules/apps/gaming
    ../../modules/git
    ../../modules/media
    ../../modules/editors
    ../../modules/shell
    ../../modules/scripts
    ../../modules/email
    ../../modules/services
    ../../modules/desktops/qtilestyle.nix
    #../../modules/desktops/stumpwmStyle.nix
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
  stylix = {
    enable = true;
    autoEnable = false;
    image = ../wallpapers/desktop-cheshire-dark.png;
    targets = {
      feh.enable = true;
      gtk = {
        enable = true;
        extraCss = ''
          // Remove rounded corners
          window.background { border-radius: 0; }
        '';
      };
    };
    #base16Scheme = ./colorschemes/matcha-dark.yaml;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      size = 16;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrains Mono Nerd Font";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      sizes = {
        desktop = 12;
        terminal = 12;
        popups = 12;
        applications = 12;
      };
    };
  };
  #colorScheme = (import ../../modules/desktops/theming/colorschemes/matcha-dark.nix);

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
    nvtopPackages.nvidia
    manga-cli
    ani-cli
    ffmpeg
    cargo
    nsxiv
    i2c-tools
    betterlockscreen
    libnotify
    pulsemixer
    bitwarden
    easyeffects
    xclip
    openrgb-with-all-plugins
    distrobox
    random-wallpaper
    nicotine-plus
    obs-studio
    feh
    lutgen

    #(callPackage ../../pkgs/nyaa.nix { })
    (ollama.override { acceleration = "cuda"; })

    uxn

    xdotool
    xorg.xwininfo

    gimp
    # wayland testing
    # waybar
    # wl-gammactl
    # wlsunset
    # grim
    # slurp
    # wl-clipboard
    # grimblast
    # swww
    # mako
  ];

  extraShell = true;

  programs.nyaa.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.file = {
    ".config/test".source = inputs.qtile-config;
  };

  #home.pointerCursor = {
  #  size = 16;
  #  package = pkgs.phinger-cursors;
  #  name = "phinger-cursors-light";
  #};

  programs.pandoc = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };

  #gtk = {
  #  enable = true;
  #  font = {
  #    name = "JetBrainsMono Nerd Font";
  #    size = 10;
  #  };

  #  #theme = {
  #  #  name = "Gruvbox-Dark-BL-LB";
  #  #  #package = inputs.stable-nixpkgs.legacyPackages."x86_64-linux".gruvbox-gtk-theme;
  #  #  package = (pkgs.gruvbox-gtk-theme.override { colorVariants = [ "dark" ]; });
  #  #};

  #  iconTheme = {
  #    name = "Gruvbox-Plus-Dark";
  #    package = pkgs.gruvbox-plus-icons;
  #  };

  #  gtk3.extraConfig = {
  #    #Settings = ''
  #    #  gtk-application-prefer-dark-theme=1
  #    #'';
  #  };

  #  gtk4.extraConfig = {
  #    #Settings = ''
  #    #  gtk-application-prefer-dark-theme=1
  #    #'';
  #  };
  #};

  #qt = {
  #  enable = false;
  #  platformTheme = "gtk";
  #  style = {
  #    name = "adwaita-dark";
  #    package = pkgs.adwaita-qt;
  #  };
  #};

  #home.sessionVariables.GTK_THEME = "Gruvbox-Plus-Dark";

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
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
