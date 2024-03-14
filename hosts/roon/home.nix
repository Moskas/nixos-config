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

  programs.bat = {
    enable = true;
    config = {
      theme = lib.mkForce "Solarized (dark)";
      color = "always";
      pager = "less -FR";
    };
  };
}
