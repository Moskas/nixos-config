{ config, pkgs, lib, username, nix-colors, nur, ... }:
let
  random-wallpaper =
    import ../../modules/scripts/random-wallpaper.nix { inherit pkgs config; };
in {
  imports = [
    nix-colors.homeManagerModules.default
    nur.nixosModules.nur
    ./wallpapers.nix
    ./gtk.nix
    ../../modules/shell
    ../../modules/browsers
    ../../modules/media
    ../../modules/apps
    ../../modules/git
    ../../modules/services
    ../../modules/editors
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
    random-wallpaper
  ];

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

  programs.bat = { config = { theme = lib.mkForce "Solarized (dark)"; }; };
}
