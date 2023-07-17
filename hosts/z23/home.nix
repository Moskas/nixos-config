{ config, pkgs, lib, ... }:

{
  home.stateVersion = "22.11";

  imports = [
    ../../modules/newsboat.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    lazygit
    jq
    neofetch
    onefetch
    tickrs
    mpc-cli
    cava
    rnix-lsp
    nixfmt
    exa
    zip
    unzip
  ];

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

  programs.rbw = {
    enable = true;
    settings = {
      email = "marcin.j.moskal@gmail.com";
      lock_timeout = 300;
    };
  };

  programs.emacs = {
    enable = true;
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
    settings = { theme_background = false; };
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
      color = "always";
      pager = "less -FR";
    };
  };
}
