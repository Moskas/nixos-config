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
        "browser.bookmarks.showMobileBookmarks" = true;
      };
      search = {
        default = "StartPage";
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
            urls = "https://osu.ppy.sh/beatmapsets?q={searchTerms}";
            definedAliases = [ "@ob" ];
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
            color: #ebdbb2;
          }

          background: #282828;
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
          background-color: #282828 !important;
        }

        /* Change the background color of the recently visited/pinned sites */
        .top-site-tile {
          background-color: #282828 !important;
        }
      '';
      userContent = ''
                  :root {
          --bg0: #282828;
          --bg0h: #1d2021;
          --bg1: #3c3836;
          --bg2: #504945;
          --bg3: #665c54;
          --bg4: #7c6f64;
          --bg5: #928374;
          --bg6: #a89984;
          --fg0: #fbf1c7;
          --fg1: #ebdbb2;
          --fg2: #d5c4a1;
          --red: #cc241d;
          --green: #98971a;
          --yellow: #d79921;
          --blue: #458588;
          --purple: #b16286;
          --aqua: #689d6a;
          --orange: #d65d0e;
        }

        @-moz-document domain(github.com) {
          .Header {
            background-color: var(--bg0) !important;
          }

          .header-search-button {
            background-color: var(--bg0h) !important;
          }

          repo>a {
            color: var(--red) !important;
          }

          repo>pinned-item-list-item {
            background-color: var(--bg1) !important;
            color: var(--fg0);
          }
        }

        @-moz-document domain(chat.openai.com) {
          * {
            font-family: "JetBrainsMono Nerd Font" !important;
            color: var(--fg0) !important;
          }

          pre {
            bg-black {
              background-color: var(--bg0);
            }
          }

          text-base {}
        }

        @-moz-document domain(youtube.com) {
          * {
            font-family: "JetBrainsMono Nerd Font" !important;
          }
        }

        @-moz-document domain(soundcloud.com) {
          * {
            font-family: "FiraCode Nerd Font" !important;
          }
        }

        @-moz-document domain(bevyengine.org) {
          * {
            font-family: "JetBrainsMono Nerd Font" !important;
          }
        }

        @-moz-document domain(codewars.com) {
          * {
            font-family: "JetBrainsMono Nerd Font" !important;
          }
        }
      '';
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
        {
          name = "Wikipedia";
          tags = [ "wiki" ];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
        {
          name = "Odysee";
          url = "https://odysse.com/";
        }
        {
          name = "Nix sites";
          toolbar = true;
          bookmarks = [
            {
              name = "Homepage";
              url = "https://nixos.org/";
            }
            {
              name = "Wiki";
              tags = [ "wiki" "nix" ];
              url = "https://nixos.wiki/";
            }
            {
              name = "Home-manager";
              tags = [ "home-manager" "nix" ];
              url = "https://nix-community.github.io/home-manager";
            }
          ];
        }
      ];
    };
  };
}
