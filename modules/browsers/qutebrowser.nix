{ config, pkgs, ... }:
let font = "JetBrainsMono Nerd Font";
in {
  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      np = "https://search.nixos.org/packages?&query={}";
      no = "https://search.nixos.org/options?&query={}";
      nw = "https://nixos.wiki/index.php?search={}";
      hm = "https://home-manager-options.extranix.com/?query={}";
      g = "https://www.google.com/search?hl=en&q={}";
      b = "https://search.brave.com/search?q={}";
      s = "https://startpage.com/search?q={}";
      e = "https://ecosia.org/search?&q={}";
      d = "https://docs.rs/releases/search?query={}";
      a = "https://annas-archive.org/search?q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      gu = "https://github.com/search?q={}&type=users";
      gr = "https://github.com/search?q={}&type=repos";
    };
    settings = {
      statusbar.show = "in-mode";
      downloads.position = "bottom";
      content.blocking.method = "both";
      tabs = {
        show = "multiple";
        show_switching_delay = 1500;
        background = true;
        title.format = "{audio}{current_title}";
      };
      scrolling.smooth = true;
      fonts = {
        prompts = "12pt ${font}";
        hints = "12pt ${font}";
        statusbar = "10pt ${font}";
        contextmenu = "10pt ${font}";
        completion = {
          entry = "12pt ${font}";
          category = "12pt ${font}";
        };
        web = {
          size.default = 16;
          family = {
            standard = "${font}";
            sans_serif = "${font}";
            fixed = "${font}";
            cursive = "${font}";
            fantasy = "${font}";
          };
        };
        tabs = {
          selected = "10pt ${font}";
          unselected = "10pt ${font}";
        };
      };
      url = {
        start_pages = "https://www.startpage.com";
        default_page = "https://www.startpage.com";
      };
      content.blocking.whitelist =
        [ "*://xeiaso.net/*" "*://ethicalads.io/*" "*://*.ethicalads.io/*" ];
      colors = {
        statusbar = {
          normal = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base07}";
          };
          command = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base07}";
          };
          insert = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base0B}";
          };
          url = {
            success.http.fg = "#${config.colorScheme.palette.base0B}";
            success.https.fg = "#${config.colorScheme.palette.base0B}";
            fg = "#${config.colorScheme.palette.base07}";
            error.fg = "#${config.colorScheme.palette.base08}";
            warn.fg = "#${config.colorScheme.palette.base08}";
            hover.fg = "#${config.colorScheme.palette.base0D}";
          };
        };
        messages = {
          error = {
            bg = "#${config.colorScheme.palette.base08}";
            fg = "#${config.colorScheme.palette.base07}";
            border = "#${config.colorScheme.palette.base07}";
          };
          warning = {
            bg = "#${config.colorScheme.palette.base08}";
            fg = "#${config.colorScheme.palette.base07}";
            border = "#${config.colorScheme.palette.base07}";
          };
          info = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base0D}";
          };
        };
        tabs = {
          indicator.stop = "#${config.colorScheme.palette.base0D}";
          odd = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base00}";
          };
          even = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base01}";
          };
          selected = {
            odd = {
              fg = "#${config.colorScheme.palette.base00}";
              bg = "#${config.colorScheme.palette.base0D}";
            };
            even = {
              fg = "#${config.colorScheme.palette.base00}";
              bg = "#${config.colorScheme.palette.base0D}";
            };
          };
        };
        hints = {
          bg = "#${config.colorScheme.palette.base00}";
          fg = "#${config.colorScheme.palette.base07}";
          match.fg = "#${config.colorScheme.palette.base0B}";
        };
        completion = {
          fg = "#${config.colorScheme.palette.base07}";
          odd.bg = "#${config.colorScheme.palette.base00}";
          even.bg = "#${config.colorScheme.palette.base01}";
          category = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base07}";
          };
          item.selected = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base07}";
            match.fg = "#${config.colorScheme.palette.base0B}";
          };
          match = { fg = "#${config.colorScheme.palette.base07}"; };
          scrollbar = {
            fg = "#${config.colorScheme.palette.base01}";
            bg = "#${config.colorScheme.palette.base00}";
          };
        };
        webpage = {
          bg = "#${config.colorScheme.palette.base00}";
          preferred_color_scheme = "${config.colorScheme.variant}";
          darkmode.enabled = false;
          darkmode.policy.images = "never";
        };
        downloads = {
          bar.bg = "#${config.colorScheme.palette.base00}";
          error = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base08}";
          };
          start = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base09}";
          };
          stop = {
            fg = "#${config.colorScheme.palette.base07}";
            bg = "#${config.colorScheme.palette.base0B}";
          };
        };
        prompts = {
          fg = "#${config.colorScheme.palette.base07}";
          bg = "#${config.colorScheme.palette.base00}";
        };
        keyhint = {
          fg = "#${config.colorScheme.palette.base07}";
          bg = "#${config.colorScheme.palette.base00}";
          suffix.fg = "#${config.colorScheme.palette.base0B}";
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
        "wd" =
          "hint links spawn kitty -e ${pkgs.yt-dlp}/bin/yt-dlp {hint-url}"; # make it more terminal agnostic
        "ww" = "hint links spawn --detach mpv {hint-url}";
        "ws" =
          "hint links spawn --detach ${pkgs.streamlink}/bin/streamlink {hint-url} best --player mpv";
        "q" = "tab-close";
      };
      prompt = { "<Ctrl-y>" = "prompt-yes"; };
    };
    extraConfig = ''
      config.unbind('d')
      c.fileselect.handler = "external"
      c.fileselect.single_file.command = ['kitty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefile', '{}']
      c.fileselect.multiple_files.command = ['kitty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefile', '{}']
    '';
  };
}
