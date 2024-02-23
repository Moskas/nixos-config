{ config, pkgs, username, nur, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      name = "${username}";
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
        "browser.search.region" = "PL";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "pl-PL";
        "general.useragent.locale" = "pl-PL";
        "app.update.auto" = false;
        "browser.bookmarks.showMobileBookmarks" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Startup
        #"browser.aboutConfig.showWarning" = false;
        #"browser.newtabpage.enabled" = false;
        #"browser.newtab.preload" = false;
        #"browser.newtabpage.activity-stream.feeds.telemetry" = false;
        #"browser.newtabpage.activity-stream.telemetry" = false;
        #"browser.newtabpage.activity-stream.feeds.snippets" = false;
        #"browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        #"browser.newtabpage.activity-stream.section.highlights.includePocket" =
        #  false;
        #"browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
        #"browser.newtabpage.activity-stream.showSponsored" = false;
        #"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        #"browser.newtabpage.activity-stream.default.sites" = "";

        # Login prompts
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "extensions.enabledScopes" = 5;
        "extensions.webextensions.restrictedDomains" = "";

        # Telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "beacon.enabled" = false;

        # Fingerprinting
        #"privacy.resistFingerprinting" = true;
        #"privacy.resistFingerprinting.block_mozAddonManager" = true;
        #"browser.startup.blankWindow" = false;
        "browser.display.use_system_colors" = true;

        # Cookies
        "browser.contentblocking.category" = "strict";
        "privacy.partition.serviceWorkers" = true;
        "privacy.partition.always_partition_third_party_non_cookie_storage" =
          true;
        "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" =
          true;
      };
      search = {
        default = "StartPage";
        force = true;
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];

            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [{
              template = "https://nixos.wiki/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
          "Home Manager Options" = {
            urls = [{
              template =
                "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
            }];
            iconUpdateURL =
              "https://mipmip.github.io/home-manager-option-search/images/favicon.png";
            # updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "hm" ];
          };
          "Osu Beatmaps" = {
            urls = [{
              template = "https://osu.ppy.sh/beatmapsets?q={searchTerms}";
            }];
            iconUpdateURL =
              "https://upload.wikimedia.org/wikipedia/commons/1/1e/Osu%21_Logo_2016.svg";
            definedAliases = [ "@ob" ];
          };
          "StartPage" = {
            urls =
              [{ template = "https://startpage.com/search?q={searchTerms}"; }];
            iconUpdateURL =
              "https://www.startpage.com/sp/cdn/images/startpage-logo-dark-new.svg";
            definedAliases = [ "@s" ];
          };
          "Brave" = {
            urls = [{
              template = "https://search.brave.com/search?q={searchTerms}";
            }];
            iconUpdateURL =
              "https://brave.com/static-assets/images/brave-logo-dark.svg";
            definedAliases = [ "@b" ];
          };
          "Docs.rs" = {
            urls = [{
              template = "https://docs.rs/releases/search?query={searchTerms}";
            }];
            iconUpdateURL =
              "https://upload.wikimedia.org/wikipedia/commons/d/d5/Rust_programming_language_black_logo.svg";
            definedAliases = [ "d" ];
          };
          "Anna's Archive" = {
            urls = [{
              template = "https://annas-archive.org/search?q={searchTerms}";
            }];
            iconUpdateURL =
              "https://annas-archive.org/favicon-32x32.png?hash=989ac03e6b8daade6d2d";
            definedAliases = [ "a" ];
          };
          "Bing".metaData.hidden = true;
          "Google".metaData.alias =
            "@g"; # builtin engines only support specifying one additional alias
        };
      };
      userChrome = ''
        /* userChrome.css from: https://github.com/Dook97/firefox-qutebrowser-userchrome*/
          :root {
            --tab-active-bg-color: #${config.colorScheme.palette.base02};
            --tab-inactive-bg-color: #${config.colorScheme.palette.base00};
            --tab-active-fg-fallback-color: #${config.colorScheme.palette.base06};
            --tab-inactive-fg-fallback-color: #${config.colorScheme.palette.base04};
            --urlbar-focused-bg-color: #${config.colorScheme.palette.base00};
            --urlbar-not-focused-bg-color: #${config.colorScheme.palette.base00};
            --toolbar-bgcolor: #${config.colorScheme.palette.base00} !important;
            --tab-font: 'JetbrainsMono Nerd Font';
            --urlbar-font: 'JetbrainsMono Nerd Font';

            --urlbar-height-setting: 32px;
            --tab-min-height: 24px !important;

            /* I don't recommend you touch this unless you know what you're doing */
            --arrowpanel-menuitem-padding: 2px !important;
            --arrowpanel-border-radius: 0px !important;
            --arrowpanel-menuitem-border-radius: 0px !important;
            --toolbarbutton-border-radius: 0px !important;
            --toolbarbutton-inner-padding: 0px 2px !important;
            --toolbar-field-focus-background-color: var(--urlbar-focused-bg-color) !important;
            --toolbar-field-background-color: var(--urlbar-not-focused-bg-color) !important;
            --toolbar-field-focus-border-color: transparent !important;

            --newtab-background-color: #${config.colorScheme.palette.base00};
            --newtab-wordmark-color: #${config.colorScheme.palette.base06};
          }

          :root[lwt-newtab-brighttext] {
                --newtab-background-color-secondary: #${config.colorScheme.palette.base02};
          }

          .search-wrapper .search-handoff-button, .search-wrapper input {
            background: #${config.colorScheme.palette.base02} !important;
          }

          /* --- GENERAL DEBLOAT ---------------------------------- */

          /* Bottom left page loading status or url preview */
          #statuspanel { display: none !important; }

          /* Hide dropdown that appears when you type in search bar */
          .autocomplete-history-popup, panel[type=autocomplete-richlistbox], panel[type=autocomplete] {
            display: none !important;
          }

          /* remove radius from right-click popup */
          menupopup, panel { --panel-border-radius: 0px !important; }
          menu, menuitem, menucaption { border-radius: 0px !important; }

          /* no stupid large buttons in right-click menu */
          menupopup > #context-navigation { display: none !important; }
          menupopup > #context-sep-navigation { display: none !important; }

          /* --- DEBLOAT NAVBAR ----------------------------------- */

          #back-button { display: none; }
          #forward-button { display: none; }
          #reload-button { display: none; }
          #stop-button { display: none; }
          #home-button { display: none; }
          #library-button { display: none; }
          #fxa-toolbar-menu-button { display: none; }
          /* empty space before and after the url bar */
          #customizableui-special-spring1, #customizableui-special-spring2 { display: none; }

          /* --- STYLE NAVBAR ------------------------------------ */

          /* remove padding between toolbar buttons */
          toolbar .toolbarbutton-1 { padding: 0 0 !important; }

          /* add padding to the right of the last button so that it doesn't touch the edge of the window */
          #PanelUI-menu-button {
            padding: 0px 4px 0px 0px !important;
          }

          #urlbar-container {
            --urlbar-container-height: var(--urlbar-height-setting) !important;
            margin-left: 0 !important;
            margin-right: 0 !important;
            padding-top: 0 !important;
            padding-bottom: 0 !important;
            font-family: var(--urlbar-font, 'monospace');
            font-size: 11px;
          }

          #urlbar {
            --urlbar-height: var(--urlbar-height-setting) !important;
            --urlbar-toolbar-height: var(--urlbar-height-setting) !important;
            min-height: var(--urlbar-height-setting) !important;
            border-color: var(--lwt-toolbar-field-border-color, hsla(240,5%,5%,.25)) !important;
          }

          #urlbar-input {
            margin-left: 0.8em !important;
            margin-right: 0.4em !important;
          }

          #navigator-toolbox {
            border: none !important;
          }

          /* keep pop-up menus from overlapping with navbar */
          #widget-overflow { margin: 0 !important; }
          #appMenu-popup { margin: 0 !important; }
          #customizationui-widget-panel { margin: 0 !important; }
          #unified-extensions-panel { margin: 0 !important; }

          /* --- UNIFIED EXTENSIONS BUTTON ------------------------ */

          /* make extension icons smaller */
          #unified-extensions-view {
            --uei-icon-size: 16px;
          }

          /* hide bloat */
          .unified-extensions-item-message-deck,
          #unified-extensions-view > .panel-header,
          #unified-extensions-view > toolbarseparator,
          #unified-extensions-manage-extensions {
            display: none !important;
          }

          /* add 3px padding on the top and the bottom of the box */
          .panel-subview-body {
            padding: 3px 0px !important;
          }

          #unified-extensions-view .unified-extensions-item-menu-button {
            margin-inline-end: 0 !important;
          }

          #unified-extensions-view .toolbarbutton-icon {
            padding: 0 !important;
          }

          .unified-extensions-item-contents {
            line-height: 1 !important;
            white-space: nowrap !important;
          }

          /* --- DEBLOAT URLBAR ----------------------------------- */

          #identity-box { display: none; }
          #pageActionButton { display: none; }
          #pocket-button { display: none; }
          #urlbar-zoom-button { display: none; }
          #tracking-protection-icon-container { display: none !important; }
          #reader-mode-button{ display: none !important; }
          #star-button { display: none; }
          #star-button-box:hover { background: inherit !important; }

          /* Go to arrow button at the end of the urlbar when searching */
          #urlbar-go-button { display: none; }

          /* remove container indicator from urlbar */
          #userContext-label, #userContext-indicator { display: none !important;}

          /* --- STYLE TAB TOOLBAR -------------------------------- */

          #titlebar {
            --proton-tab-block-margin: 0px !important;
            --tab-block-margin: 0px !important;
          }

          #TabsToolbar, .tabbrowser-tab {
            max-height: var(--tab-min-height) !important;
            font-size: 11px !important;
          }

          /* Change color of normal tabs */
          tab:not([selected="true"]) {
            background-color: var(--tab-inactive-bg-color) !important;
            color: var(--identity-icon-color, var(--tab-inactive-fg-fallback-color)) !important;
          }

          tab {
            font-family: var(--tab-font, monospace);
            font-weight: bold;
            border: none !important;
          }

          /* safari style tab width */
          .tabbrowser-tab[fadein] {
            max-width: 100vw !important;
            border: none
          }

          /* Hide close button on tabs */
          #tabbrowser-tabs .tabbrowser-tab .tab-close-button { display: none !important; }

          /* disable favicons in tab */
          /* .tab-icon-stack:not([pinned]) { display: none !important; } */

          .tabbrowser-tab {
            /* remove border between tabs */
            padding-inline: 0px !important;
            /* reduce fade effect of tab text */
            --tab-label-mask-size: 1em !important;
            /* fix pinned tab behaviour on overflow */
            overflow-clip-margin: 0px !important;
          }

          /* Tab: selected colors */
          #tabbrowser-tabs .tabbrowser-tab[selected] .tab-content {
            background: var(--tab-active-bg-color) !important;
            color: var(--identity-icon-color, var(--tab-active-fg-fallback-color)) !important;
          }

          /* Tab: hovered colors */
          #tabbrowser-tabs .tabbrowser-tab:hover:not([selected]) .tab-content {
            background: var(--tab-active-bg-color) !important;
          }

          /* hide window controls */
          .titlebar-buttonbox-container { display: none; }

          /* remove titlebar spacers */
          .titlebar-spacer { display: none !important; }

          /* disable tab shadow */
          #tabbrowser-tabs:not([noshadowfortests]) .tab-background:is([selected], [multiselected]) {
              box-shadow: none !important;
          }

          /* remove dark space between pinned tab and first non-pinned tab */
          #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs]) >
          #tabbrowser-arrowscrollbox >
          .tabbrowser-tab:nth-child(1 of :not([pinned], [hidden])) {
          margin-inline-start: 0px !important;
          }

          /* remove dropdown menu button which displays all tabs on overflow */
          #alltabs-button { display: none !important }

          /* fix displaying of pinned tabs on overflow */
          #tabbrowser-tabs:not([secondarytext-unsupported]) .tab-label-container {
            height: var(--tab-min-height) !important;
          }

          /* remove overflow scroll buttons */
          #scrollbutton-up, #scrollbutton-down { display: none !important; }

          /* remove new tab button */
          #tabs-newtab-button {
            display: none !important;
          }

          /* hide private browsing indicator */
          #private-browsing-indicator-with-label {
            display: none;
          }

          /* --- AUTOHIDE NAVBAR ---------------------------------- */

          /* hide navbar unless focused */
          #nav-bar {
            min-height: 0 !important;
            max-height: 0 !important;
            height: 0 !important;
            --moz-transform: scaleY(0) !important;
            transform: scaleY(0) !important;
          }

          /* show on focus */
          #nav-bar:focus-within {
            --moz-transform: scale(1) !important;
            transform: scale(1) !important;
            max-height: var(--urlbar-height-setting) !important;
            height: var(--urlbar-height-setting) !important;
            min-height: var(--urlbar-height-setting) !important;
          }

          #navigator-toolbox:focus-within > .browser-toolbar {
            transform: translateY(0);
            opacity: 1;
          }

      '';
      userContent = "";
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        stylus
        vimium
        bitwarden
        betterttv
        sponsorblock
        return-youtube-dislikes
      ];
      bookmarks = [
        #  {
        #    name = "Wikipedia";
        #    tags = [ "wiki" ];
        #    keyword = "wiki";
        #    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        #  }
        #  {
        #    name = "Odysee";
        #    url = "https://odysse.com/";
        #  }
        #  {
        #    name = "Nix sites";
        #    toolbar = true;
        #    bookmarks = [
        #      {
        #        name = "Homepage";
        #        url = "https://nixos.org/";
        #      }
        #      {
        #        name = "Wiki";
        #        tags = [ "wiki" "nix" ];
        #        url = "https://nixos.wiki/";
        #      }
        #      {
        #        name = "Home-manager";
        #        tags = [ "home-manager" "nix" ];
        #        url = "https://nix-community.github.io/home-manager";
        #      }
        #    ];
        #  }
      ];
    };
  };
}
