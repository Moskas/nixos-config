{ config, lib, pkgs, username, ... }:

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
          "Bing".metaData.hidden = true;
          "Google".metaData.alias =
            "@g"; # builtin engines only support specifying one additional alias
        };
      };
      userChrome = ''
        @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

        /* only needed once */
        * {
          font-family: "JetBrainsMono Nerd Font" !important;

        }

        /* ROOT - VARS */
        *|*:root {
          --tab-min-height: 20px !important;
          /* adjust */
          --tab-min-width: 60px !important;
          /* adjust */
        }

        /* Curve the background tabs at the upper left and right corners
           May not work on add-on themes. */
        .tabbrowser-tab {
          padding: 0 auto !important;
          height: 35px;
        }

        /* Curve active tab and slightly overlap neighboring tabs */
        .tabbrowser-tab .tab-background[selected="true"] {
          margin-left: -1px !important;
          margin-right: -1px !important;
          margin-top: 2px !important;
          padding: 0 auto !important;
        }

        /* Remove the tab line along the tops of tabs */
        .tab-line {
          transform: none !important;
          background-color: transparent !important;
        }

        /* Remove the vertical lines between background tabs */
        .tabbrowser-tab::before,
        .tabbrowser-tab::after {
          margin-bottom: 0.2px !important;
          border-left: none !important;
          /* Remove borders from inactive tabs */
        }

        /* Modify the color fo the sound icon */
        .tab-icon-sound {
          filter: hue-rotate(50deg) saturate(200%) brightness(90%) sepia(50%) hue-rotate(20deg) drop-shadow(0 0 2px #fbf1c7);

          /* Change the sound icon in pinned tabs */
          list-style-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23fbf1c7'%3E%3Cpath d='M12 2C6.48 2 2 6.48 2 12c0 5.52 4.48 10 10 10s10-4.48 10-10c0-5.52-4.48-10-10-10zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-12v8h2v-8h-2z'/%3E%3C/svg%3E") !important;
        }

        .tab-icon-sound-label {
          /*display: none !important;*/
        }

        /* Change navbar size and color */
        #nav-bar {
          max-height: 30px !important;

          * {
            color: #${config.colorScheme.colors.base07};
          }

          background: #${config.colorScheme.colors.base00};
        }

        /* Shrink tab-bar width and height */
        #TabsToolbar {
          height: 24px !important;
          min-height: 24px !important;
        }

        /* Center tab text vertically and horizontally */
        .tab-label {
          padding-top: 2px !important;
          padding-bottom: 2px !important;
          text-align: center !important;
          -moz-box-pack: center !important;
          -moz-box-align: center !important;
          justify-content: center !important;
          max-width: 200px;
          min-width: 50px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        /* Disable rounded corners in tabs */
        .tab-background {
          border-radius: 0 !important;
          border: none !important;
        }

        /* Change the background color of the search bar */
        #searchbar {
          background-color: #${config.colorScheme.colors.base07} !important;
        }

        /* Change the background color of the recently visited/pinned sites */
        .top-site-tile {
          background-color: #${config.colorScheme.colors.base07} !important;
        }
      '';
      userContent = "";
      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #  darkreader
      #  stylus
      #  vimium
      #  bitwarden
      #  betterttv
      #  sponsorblock
      #  return-youtube-dislikes
      #];
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
