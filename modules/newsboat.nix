{ config, lib, pkgs, ... }:

{
  programs.newsboat = {
    enable = true;
    browser = "qutebrowser";
    autoReload = true;
    reloadThreads = 8;
    extraConfig = ''
      color article                                       color15  color235
      color background                                    color2   color235
      color info                                          color2   color235
      color listfocus                                     color15  color8   bold
      color listfocus_unread                              color15  color8   bold
      color listnormal                                    color8   color235
      color listnormal_unread                             color6   color235
      highlight article "^Feed:.*"                        color14  color235
      highlight article "^Title:.*"                       color11  color235 bold
      highlight article "^Author:.*"                      color13  color235
      highlight article "^Link:.*"                        color12  color235
      highlight article "^Links:.*"                       color12  color235
      highlight article "\\[[0-9]\\]:.*"                  color3   color235 bold
      highlight article "^Podcast Download URL:.*"        color12  color235
      highlight article "^\\[image.*"                     color14  color235
      highlight article "\\ \\[image*\\]\\ "                     color14  color235
      highlight article "^https://.*"                     color12  color235
      highlight article "^http://.*"                      color12  color235
      highlight article "^Date:.*"                        color10  color235
      highlight article "\\*\ "                           color13  color235 bold
      highlight article "\\[0-9]\\.\ "                           color13  color235 bold
      highlight article "\\[[0-9]\\+\\]"                  color3   color235 bold
      highlight article "\\[[^0-9].*[0-9]\\+\\]"          color13  color235 bold

      macro v set browser "setsid -f mpv --really-quiet --no-terminal" ; open-in-browser ; set browser brave
      player "mpv"

      bind-key RIGHT open
      bind-key LEFT quit

      bind-key l open
      bind-key j down
      bind-key k up
      bind-key h quit
    '';
    urls = [
      {
        url = "\"query:Youtube:tags # \\\"Youtube\\\"\"";
      }
      {
        url = "\"query:Odysee:tags # \\\"Odysee\\\"\"";
      }
      {
        url = "\"query:Piped:tags # \\\"Piped\\\"\"";
      }
      {
        url = "\"query:Blog:tags # \\\"Blog\\\"\"";
      }
      {
        url = "\"query:Wrocław:tags # \\\"Wrocław\\\"\"";
      }
      {
        tags = [ "linux" ];
        url = "https://www.phoronix.com/rss.php";
      }
      {
        tags = [ "games" ];
        url = "https://terrysfreegameoftheweek.com/feed/";
      }
      {
        tags = [ "linux" "tech" ];
        url = "https://myme.no/feed.xml";
      }
      {
        tags = [ "media" ];
        url =
          "https://pipedapi.kavin.rocks/feed/rss?authToken=5f754893-4492-46a1-8d5a-bfbeb8def939";
      }
      {
        tags = [ "Youtube" ];
        url =
          "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw";
      }
      #Jobs
      {
        url = "https://justjoin.it/feed.atom";
        tags = [ "jobs" ];
      }
      #Videos
      ##Youtube
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ";
        tags = [ "Youtube" ];
        title = "Veronica Explains";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsnGwSIHyoYN0kiINAGUKxg";
        tags = [ "Youtube" ];
        title = "Wolfgang";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw";
        tags = [ "Youtube" ];
        title = "TheLinuxExperiment";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR-DXc1voovS8nhAvccRZhg";
        tags = [ "Youtube" ];
        title = "Jeff Geerling";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC9x0AN7BWHpCDHSm9NiJFJQ";
        tags = [ "Youtube" ];
        title = "Network Chuck";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCruD32HAzsb9UN4KpOcSxZg";
        tags = [ "Youtube" ];
        title = "London Eats";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCC_NjLEb2Sley94py4vSYTA";
        tags = [ "Youtube" ];
        title = "Andres Vidoza";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCeOouRs24EmbFPdgEghtRZQ";
        tags = [ "Youtube" ];
        title = "Jon Imperial";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEfopmnijwEA9sCOD_hfRtA";
        tags = [ "Youtube" ];
        title = "Michael Soledad";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6vOAOQUX2v1dlDj5YLoJ5g";
        tags = [ "Youtube" ];
        title = "Aivars Meijers";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCCQ6SXMc7MoJ88jjpn6j-8Q";
        tags = [ "Youtube" ];
        title = "Marko";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnn3N0i3TVGbQ9bMb4ln2OQ";
        tags = [ "Youtube" ];
        title = "Kyle Erickson";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoOae5nYA7VqaXzerajD0lg";
        tags = [ "Youtube" ];
        title = "Ali Abdaal";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ";
        tags = [ "Youtube" ];
        title = "System Crafters";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgDqL4yzXb4BflimZaxL4Vg";
        tags = [ "Youtube" ];
        title = "Andrew E.Zeng";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2hi12ngz1aiGv_vditVHGw";
        tags = [ "Youtube" ];
        title = "Brandon Boswell";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvfUcuSDNOoFsAPsiGdaGPg";
        tags = [ "Youtube" ];
        title = "Notebook Check";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA";
        tags = [ "Youtube" ];
        title = "Learn Linux TV";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLuJuI0M95qWsVw_KQOkTgQ";
        tags = [ "Youtube" ];
        title = "Pinsplash";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCJ6KZTTnkE-s2XFJJmoTAkw";
        tags = [ "Youtube" ];
        title = "Accursed Farms";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw";
        tags = [ "Youtube" ];
        title = "LinusTechTips";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjREVt2ZJU8ql-NC9Gu-TJw";
        tags = [ "Youtube" ];
        title = "Code to the Moon";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCNhWSOlt_UoCzS2YSMhHYmA";
        tags = [ "Youtube" ];
        title = "Kai Notebook";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLx053rWZxCiYWsBETgdKrQ";
        tags = [ "Youtube" ];
        title = "LGR";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8uT9cgJorJPWu7ITLGo9Ww";
        tags = [ "Youtube" ];
        title = "The 8-Bit Guy";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCerEIdrEW-IqwvlH8lTQUJQ";
        tags = [ "Youtube" ];
        title = "Tech Tangents";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoL8olX-259lS1N6QPyP4IQ";
        tags = [ "Youtube" ];
        title = "Action Retro";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7yZ6keOGsvERMp2HaEbbXQ";
        tags = [ "Youtube" ];
        title = "devaslife";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0lE_IPPXhb_J9sZnMyIEwA";
        tags = [ "Youtube" ];
        title = "llll colonq";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";
        tags = [ "Youtube" ];
        title = "No Boilerplate";
      }
      #{
      #url = "https://www.youtube.com/feeds/videos.xml?channel_id="; tags = [ "Youtube" ];
      #title = "";
      #}
      #{
      #url = "https://www.youtube.com/feeds/videos.xml?channel_id="; tags = [ "Youtube" ];
      #title = "";
      #}
      #{
      #url = "https://www.youtube.com/feeds/videos.xml?channel_id="; tags = [ "Youtube" ];
      #title = "";
      #}
      ##Odysee
      {
        url = "https://odysee.com/$/rss/@Urbandoned:5";
        tags = [ "Odysee" ];
        title = "Urbandoned";
      }
      {
        url = "https://odysee.com/$/rss/@AlphaNerd:8";
        tags = [ "Odysee" ];
        title = "Mental Outlaw";
      }
      {
        url = "https://odysee.com/$/rss/@bugswriter:8";
        tags = [ "Odysee" ];
        title = "bugswriter";
      }
      {
        url = "https://odysee.com/$/rss/@DistroTube:2";
        tags = [ "Odysee" ];
        title = "DistroTube";
      }
      {
        url = "https://odysee.com/$/rss/@BrodieRobertson:5";
        tags = [ "Odysee" ];
        title = "BrodieRobertson";
      }
      {
        url = "https://odysee.com/$/rss/@SomeOrdinaryGamers:a";
        tags = [ "Odysee" ];
        title = "Mutahar";
      }
      {
        url = "https://odysee.com/$/rss/@thelinuxcast:4";
        tags = [ "Odysee" ];
        title = "TheLinuxCast";
      }
      {
        url = "https://odysee.com/$/rss/@rootbsd:6";
        tags = [ "Odysee" ];
        title = "Root BSD";
      }
      {
        url = "https://odysee.com/$/rss/@TheOpenBSDGuy:e";
        tags = [ "Odysee" ];
        title = "The OpenBSD Guy";
      }
      {
        url = "https://odysee.com/$/rss/@SwindlesMcCoop:1";
        tags = [ "Odysee" ];
        title = "SwindlesMcCoop";
      }
      {
        url = "https://odysee.com/$/rss/@adriansdigitalbasement:f";
        tags = [ "Odysee" ];
        title = "Adrian's DB";
      }
      {
        url = "https://odysee.com/$/rss/@mechtechkeyboards:b";
        tags = [ "Odysee" ];
        title = "Mechkeyboards";
      }
      {
        url = "https://odysee.com/$/rss/@michaelnr0h:7";
        tags = [ "Odysee" ];
        title = "Michael Horn";
      }
      {
        url = "https://odysee.com/$/rss/@fireship:6";
        tags = [ "Odysee" ];
        title = "Fireship";
      }
      {
        url = "https://odysee.com/$/rss/@internetczasdzialac:6";
        tags = [ "Odysee" ];
        title = "Internet. Czas działać!";
      }
      {
        url = "https://odysee.com/$/rss/@bryce:c";
        tags = [ "Odysee" ];
        title = "Bryce Vandegrift";
      }
      {
        url = "https://odysee.com/$/rss/@EmMerge:f";
        tags = [ "Odysee" ];
        title = "Emilia Emerge";
      }
      {
        url = "https://odysee.com/$/rss/@GavinFreeborn:d";
        tags = [ "Odysee" ];
        title = "Gavin Freeborn";
      } ##Piped
      {
        url = "https://pipedapi.kavin.rocks/feed/rss?authToken=5f754893-4492-46a1-8d5a-bfbeb8def939";
        tags = [ "Piped" ];
      }
      {
        url = "https://pipedapi.kavin.rocks/feed/unauthenticated/rss?channels=UCBJycsmduvYEL83R_U4JriQ";
        tags = [ "Piped" ];
      }
      #Blog
      {
        url = "https://emacsredux.com/atom.xml";
        tags = [ "Tech" "Emacs" "Blog" ];
      }
      {
        url = "https://emacstil.com/feed.xml";
        tags = [ "Tech" "Emacs" "Blog" ];
      }
      {
        url = "https://irreal.org/blog/?feed=rss2";
        tags = [ "Tech" "Emacs" "Blog" ];
      }
      {
        url = ''https://mbork.pl/?action=rss;days=30;all=0;showedit=0;full=1'';
        tags = [ "Tech" "Emacs" "Blog" ];
      }
      {
        url = "https://morss.it/https://planet.emacslife.com/atom.xml";
        tags = [ "Tech" "Emacs" ];
      }
      {
        url = "https://xeiaso.net/blog.rss";
        tags = [ "Tech" "Nix" "Blog" ];
      }
      {
        url = "https://morss.it/https://www.phoronix.com/rss.php";
        tags = [ "Blog" ];
      }
      {
        url = "https://hackaday.com/feed/";
        tags = [ "Blog" ];
      }
      {
        url = "https://itsfoss.com/rss/";
        tags = [ "Blog" ];
      }
      {
        url = "https://blog.rust-lang.org/feed.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://thelinuxexp.com/feed.xml";
        tags = [ "Blog" ];
      }
      #{
      #url = "https://dev.to/feed"; tags = [ "Blog"  "Programming" ];
      #}
      {
        url = "https://dev.to/feed/tag/rust";
        tags = [ "Blog" "Programming" "Rust" ];
      }
      {
        url = "https://dev.to/feed/tag/python";
        tags = [ "Blog" "Programming" ];
      }
      {
        url = "https://dev.to/feed/tag/cpp";
        tags = [ "Blog" "Programming" ];
      }
      {
        url = "https://zettelkasten.de/feed.atom";
        tags = [ "Blog" "Notes" ];
      }
      {
        url = "https://morss.it/https://cult.honeypot.io/rss.xml";
        tags = [ "Blog" "Programming" ];
      }
      {
        url = "https://blog.phundrak.com/index.xml";
        tags = [ "Blog" "Tech" ];
      }
      {
        url = "https://vermaden.wordpress.com/feed";
        tags = [ "Blog" "Tech" ];
      }
      {
        url = "https://morss.it/https://fasterthanli.me/index.xml";
        tags = [ "Blog" "Tech" ];
      }
      {
        url = "https://morss.it/https://aliabdaal.com/feed/";
        tags = [ "Blog" ];
      }
      {
        url = "https://programmershideaway.xyz/atom.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://www.jeffgeerling.com/blog.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://ploum.net/atom_en.xml";
        tags = [ "Blog" ];
      }
      #Twitch?
      {
        url = "https://twitchrss.appspot.com/vod/kycu";
        tags = [ "Twitch" ];
        title = "Kycu";
      }
      {
        url = "https://twitchrss.appspot.com/vod/slayproxx";
        tags = [ "Twitch" ];
        title = "Slay";
      }
      {
        url = "https://twitchrss.appspot.com/vod/cirno_tv";
        tags = [ "Twitch" ];
        title = "Cirno";
      }
      {
        url = "https://twitchrss.appspot.com/vod/lcolonq";
        tags = [ "Twitch" ];
        title = "lcolonq";
      }
      {
        url = "https://twitchrss.appspot.com/vod/yukievt";
        tags = [ "Twitch" ];
        title = "yukievt";
      }
      {
        url = "https://twitchrss.appspot.com/vod/enlynn_";
        tags = [ "Twitch" ];
        title = "enlynn_";
      }
      {
        url = "https://twitchrss.appspot.com/vod/cirno_tv";
        tags = [ "Twitch" ];
      }
      #{
      #url = "https://twitchrss.appspot.com/vod/cirno_tv"; tags = [ "Twitch" ];
      #}
      {
        url = "https://github.com/NixOS/nixpkgs/commits/master.atom";
        tags = [ "Updates" ];
        title = "nixpkgs";
      }
      #News
      {
        url = "https://morss.it/https://gazetawroclawska.pl/rss/gazetawroclawska.xml";
        tags = [ "Wrocław" ];
      }
      {
        url = "https://morss.it/https://www.wroclaw.pl/dla-mieszkanca/rss/";
        tags = [ "Wrocław" ];
      }
      {
        url = "https://morss.it/https://www.wroclaw.pl/kultura/rss/";
        tags = [ "Wrocław" "Culture" ];
      }
      {
        url = "https://morss.it/https://www.wroclaw.pl/komunikacja/rss/";
        tags = [ "Wrocław" ];
      }
      {
        url = "https://dcf.wroclaw.pl/feed/";
        tags = [ "Wrocław" "Culture" ];
      }
      {
        url = "https://konwenty-poludniowe.pl/?format=feed&type=atom";
        tags = [ "Culture" ];
      }
      {
        url = "https://www.internet-czas-dzialac.pl/rss";
        tags = [ "Tech" ];
      }
      {
        url = "https://morss.it/https://www.theregister.com/headlines.atom";
        tags = [ "Tech" ];
      }
    ];
  };
}