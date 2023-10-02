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
        hints = "10pt JetBrainsMono Nerd Font";
        statusbar = "12pt JetBrainsMono Nerd Font";
        contextmenu = "10pt JetBrainsMono Nerd Font";
        completion = {
          entry = "12pt JetBrainsMono Nerd Font";
          category = "12pt JetBrainsMono Nerd Font";
        };
        web = {
          size.default = 14;
          family = {
            standard = "JetBrainsMono Nerd Font";
            sans_serif = "JetBrainsMono Nerd Font";
            fixed = "JetBrainsMono Nerd Font";
            cursive = "JetBrainsMono Nerd Font";
            fantasy = "JetBrainsMono Nerd Font";
          };
        };
        tabs = {
          selected = "10pt JetBrainsMono Nerd Font";
          unselected = "10pt JetBrainsMono Nerd Font";
        };
      };
      url = { start_pages = "https://www.google.com"; };
      content.blocking.whitelist =
        [ "*://xeiaso.net/*" "*://ethicalads.io/*" "*://*.ethicalads.io/*" ];
      colors = {
        statusbar = {
          normal = {
            bg = "#282828";
            fg = "#fbf1c7";
          };
          command = {
            bg = "#282828";
            fg = "#fbf1c7";
          };
          insert = {
            bg = "#282828";
            fg = "#b8bb26";
          };
          url = {
            success.http.fg = "#b8bb26";
            success.https.fg = "#b8bb26";
            fg = "#fbf1c7";
            error.fg = "#cc241d";
            warn.fg = "#cc241d";
            hover.fg = "#83a598";
          };
        };
        messages = {
          error = {
            bg = "#cc241d";
            fg = "#fbf1c7";
            border = "#fbf1c7";
          };
          warning = {
            bg = "#cc241d";
            fg = "#fbf1c7";
            border = "#fbf1c7";
          };
          info = {
            fg = "#fbf1c7";
            bg = "#83a598";
          };
        };
        tabs = {
          indicator.stop = "#83a598";
          odd = {
            fg = "#fbf1c7";
            bg = "#282828";
          };
          even = {
            fg = "#fbf1c7";
            bg = "#3c3836";
          };
          selected = {
            odd = {
              fg = "#282828";
              bg = "#458588";
            };
            even = {
              fg = "#282828";
              bg = "#458588";
            };
          };
        };
        hints = {
          bg = "#282828";
          fg = "#fbf1c7";
          match.fg = "#b8bb26";
        };
        completion = {
          fg = "#fbf1c7";
          odd.bg = "#282828";
          even.bg = "#3c3836";
          category = {
            bg = "#282828";
            fg = "#fbf1c7";
          };
          item.selected = {
            bg = "#282828";
            fg = "#fbf1c7";
            match.fg = "#b8bb26";
          };
          match = { fg = "#fbf1c7"; };
          scrollbar = {
            fg = "#3c3836";
            bg = "#282828";
          };
        };
        webpage = {
          bg = "#282828";
          preferred_color_scheme = "dark";
          darkmode.enabled = false;
          darkmode.policy.images = "never";
        };
        downloads = {
          bar.bg = "#282828";
          error = {
            fg = "#fbf1c7";
            bg = "#cc241d";
          };
          start = {
            fg = "#fbf1c7";
            bg = "#d79921";
          };
          stop = {
            fg = "#fbf1c7";
            bg = "#b8bb26";
          };
        };
        prompts = {
          fg = "#fbf1c7";
          bg = "#282828";
        };
        keyhint = {
          fg = "#fbf1c7";
          bg = "#282828";
          suffix.fg = "#b8bb26";
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
        "Wd" =
          "hint links spawn kitty -e yt-dlp {hint-url}"; # make it more terminal agnostic
        "W" = "hint links spawn --detach mpv {hint-url}";
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
