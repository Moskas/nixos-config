{ config, pkgs, ... }: {
  # Vesktop
  home = { packages = with pkgs; [ vesktop ]; };

  xdg = {
    configFile = {
      "vesktop/themes/nix-colors-theme.css" = {
        text = ''
          .theme-dark {
             --background-primary: #${config.colorScheme.palette.base01};
             /* background of background of chat window */
             --background-secondary: #${config.colorScheme.palette.base00};
             /* background of channel bar */
             --background-secondary-alt: #${config.colorScheme.palette.base00};
             /* background of profile */
             --channel-textarea-background: #${config.colorScheme.palette.base00};
             /* background of textarea */
             --background-tertiary: #${config.colorScheme.palette.base01};
             /* background of channel bar */
             --background-accent: #${config.colorScheme.palette.base01};
             --text-normal: #${config.colorScheme.palette.base06};
             --text-spotify: #${config.colorScheme.palette.base02};
             --text-muted: #${config.colorScheme.palette.base07};
             --text-link: #${config.colorScheme.palette.base04};
             --background-floating: #${config.colorScheme.palette.base01};
             --header-primary: #${config.colorScheme.palette.base06};
             --header-secondary: #${config.colorScheme.palette.base06};
             --header-spotify: #${config.colorScheme.palette.base02};
             --interactive-normal: #${config.colorScheme.palette.base06};
             --interactive-hover: #${config.colorScheme.palette.base07};
             --interactive-active: #${config.colorScheme.palette.base06};
             --ping: #${config.colorScheme.palette.base03};
             --background-modifier-selected: #${config.colorScheme.palette.base01};
             --scrollbar-thin-thumb: #${config.colorScheme.palette.base03};
             --scrollbar-thin-track: transparent;
             --scrollbar-auto-thumb: #${config.colorScheme.palette.base03};
             --scrollbar-auto-track: transparent;
             --channels-default: #${config.colorScheme.palette.base05};
          }

          body {
             --font-display:  JetBrainsMono Nerd Font;
             font-size: 17px;
          }

          * {
            font-family: JetBrainsMono Nerd Font !important;
            font-size: 17px;
          }

          .body-2wLx-E,
          .headerTop-3GPUSF,
          .bodyInnerWrapper-2bQs1k,
          .footer-3naVBw {
            background-color: var(--background-tertiary);
          }

          .title-17SveM,
          .name-3Uvkvr {
            font-size: 12px;
          }

          .panels-3wFtMD {
            background-color: var(--background-secondary);
          }

          .username-h_Y3Us {
            font-family: var(--font-display);
            font-size: 12px;
          }

          .peopleColumn-1wMU14,
          .panels-j1Uci_,
          .peopleColumn-29fq28,
          .peopleList-2VBrVI,
          .content-2hZxGK,
          .header-1zd7se,

          .root-g14mjS .small-23Atuv .fullscreenOnMobile-ixj0e3 {
            background-color: var(--background-secondary);
          }

          .textArea-12jD-V,
          .lookBlank-3eh9lL,
          .threadSidebar-1o3BTy,
          .scrollableContainer-2NUZem,
          .perksModalContentWrapper-3RHugb,
          .theme-dark .footer-31IekZ,

          .theme-light .footer-31IekZ {
            background-color: var(--background-tertiary);
          }

          [class*=textArea] {
            color: var(--text-muted);
          }

          .numberBadge-2s8kKX,
          .base-PmTxvP,
          .baseShapeRound-1Mm1YW,
          .bar-30k2ka,
          .unreadMentionsBar-1Bu1dC,
          .mention-1f5kbO,
          .active-1SSsBb,

          .disableButton-220a9y {
            background-color: var(--ping) !important;
          }

          .lookOutlined-3sRXeN.colorRed-1TFJan,
          .lookOutlined-3sRXeN.colorRed-1TFJan {
            color: var(--ping) !important;
          }

          .header-3OsQeK,
          .container-ZMc96U {
            box-shadow: none !important;
            border: none !important;
          }

          .content-1gYQeQ,
          .layout-1qmrhw,
          .inputDefault-3FGxgL,
          .input-2g-os5,
          .input-2z42oC,
          .role-2TIOKu,

          .searchBar-jGtisZ {
            border-radius: 6px;
          }

          .layout-1qmrhw:hover,
          .content-1gYQeQ:hover {
            background-color: var(--background-modifier-selected) !important;
          }

          .container-3wLKDe {
            background-color: var(--background-secondary) !important;
          }

          .title-31SJ6t {
            background-color: var(--background-primary) !important;
          }

          .scrollableContainer__33e06.themedBackground__6b1b6.webkit__8d35a {
            background-color: var(--background-secondary);
          }

          .wrapper_d281dd:hover .childWrapper__01b9c,
          .wrapper_d281dd.selected_f5ec8e .childWrapper__01b9c {
            background-color: #${config.colorScheme.palette.base06};
          }

          .container_b181b6 {
            background-color: var(--background-secondary);
          }

          .theme-dark .themed_b152d4 {
            background-color: var(--background-secondary);
          }

          [class*=slateTextArea] {
            color: var(--text-muted);
          }
        '';
      };
    };
  };
}
