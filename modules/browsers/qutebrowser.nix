{ config, lib, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    package = pkgs.qutebrowser;
    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      np = "https://search.nixos.org/packages?&query={}";
      nw = "https://nixos.wiki/index.php?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      b = "https://www.search.brave.com/search?q={}";
      s = "https://startpage.com/search?q={}";
      e = "https://ecosia.org/search?&q={}";
    };
    settings = {
      statusbar.show = "in-mode";
      downloads.position = "bottom";
      tabs = {
        show = "multiple";
        show_switching_delay = 1500;
        background = true;
        title.format = "{audio}{current_title}";
      };
      scrolling.smooth = true;
      fonts = {
        prompts = "12pt JetBrainsMono Nerd Font";
        hints = "12pt JetBrainsMono Nerd Font";
        statusbar = "12pt JetBrainsMono Nerd Font";
        contextmenu = "10pt JetBrainsMono Nerd Font";
        completion = {
          entry = "12pt JetBrainsMono Nerd Font";
          category = "12pt JetBrainsMono Nerd Font";
        };
        web = {
          size.default = 16;
          family = {
            standard = "JetBrainsMono Nerd Font";
            sans_serif = "JetBrainsMono Nerd Font";
            fixed = "JetBrainsMono Nerd Font";
            cursive = "JetBrainsMono Nerd Font";
            fantasy = "JetBrainsMono Nerd Font";
          };
        };
        tabs = {
          selected = "12pt JetBrainsMono Nerd Font";
          unselected = "12pt JetBrainsMono Nerd Font";
        };
      };
      url = { start_pages = "https://www.google.com"; };
      content.blocking.whitelist =
        [ "*://xeiaso.net/*" "*://ethicalads.io/*" "*://*.ethicalads.io/*" ];
      colors = {
        statusbar = {
          normal = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base07}";
          };
          command = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base07}";
          };
          insert = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base0B}";
          };
          url = {
            success.http.fg = "#${config.colorScheme.colors.base0B}";
            success.https.fg = "#${config.colorScheme.colors.base0B}";
            fg = "#${config.colorScheme.colors.base07}";
            error.fg = "#${config.colorScheme.colors.base08}";
            warn.fg = "#${config.colorScheme.colors.base08}";
            hover.fg = "#${config.colorScheme.colors.base0D}";
          };
        };
        messages = {
          error = {
            bg = "#${config.colorScheme.colors.base08}";
            fg = "#${config.colorScheme.colors.base07}";
            border = "#${config.colorScheme.colors.base07}";
          };
          warning = {
            bg = "#${config.colorScheme.colors.base08}";
            fg = "#${config.colorScheme.colors.base07}";
            border = "#${config.colorScheme.colors.base07}";
          };
          info = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base0D}";
          };
        };
        tabs = {
          indicator.stop = "#${config.colorScheme.colors.base0D}";
          odd = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base00}";
          };
          even = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base01}";
          };
          selected = {
            odd = {
              fg = "#${config.colorScheme.colors.base00}";
              bg = "#${config.colorScheme.colors.base0D}";
            };
            even = {
              fg = "#${config.colorScheme.colors.base00}";
              bg = "#${config.colorScheme.colors.base0D}";
            };
          };
        };
        hints = {
          bg = "#${config.colorScheme.colors.base00}";
          fg = "#${config.colorScheme.colors.base07}";
          match.fg = "#${config.colorScheme.colors.base0B}";
        };
        completion = {
          fg = "#${config.colorScheme.colors.base07}";
          odd.bg = "#${config.colorScheme.colors.base00}";
          even.bg = "#${config.colorScheme.colors.base01}";
          category = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base07}";
          };
          item.selected = {
            bg = "#${config.colorScheme.colors.base00}";
            fg = "#${config.colorScheme.colors.base07}";
            match.fg = "#${config.colorScheme.colors.base0B}";
          };
          match = { fg = "#${config.colorScheme.colors.base07}"; };
          scrollbar = {
            fg = "#${config.colorScheme.colors.base01}";
            bg = "#${config.colorScheme.colors.base00}";
          };
        };
        webpage = {
          bg = "#${config.colorScheme.colors.base00}";
          preferred_color_scheme = "dark";
          darkmode.enabled = false;
          darkmode.policy.images = "never";
        };
        downloads = {
          bar.bg = "#${config.colorScheme.colors.base00}";
          error = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base08}";
          };
          start = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base09}";
          };
          stop = {
            fg = "#${config.colorScheme.colors.base07}";
            bg = "#${config.colorScheme.colors.base0B}";
          };
        };
        prompts = {
          fg = "#${config.colorScheme.colors.base07}";
          bg = "#${config.colorScheme.colors.base00}";
        };
        keyhint = {
          fg = "#${config.colorScheme.colors.base07}";
          bg = "#${config.colorScheme.colors.base00}";
          suffix.fg = "#${config.colorScheme.colors.base0B}";
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
