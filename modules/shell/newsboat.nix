{
  programs.newsboat = {
    enable = true;
    browser = "qutebrowser";
    autoReload = true;
    reloadThreads = 8;
    extraConfig = ''
      color background         default   default
      color listnormal         color8    default
      color listnormal_unread  default   default
      color listfocus          white     yellow bold
      color listfocus_unread   white   yellow bold
      color info               green     default bold
      color article            default   default
      highlight article "^Feed:.*"                        cyan  default
      highlight article "^Title:.*"                       yellow default bold
      highlight article "^Author:.*"                      magenta default
      highlight article "^Link:.*"                        blue  default
      highlight article "^Links:.*"                       blue  default
      highlight article "\\[[0-9]\\]:.*"                  yellow   default bold
      highlight article "^Podcast Download URL:.*"        blue  default
      highlight article "^\\[image.*"                     cyan  default
      highlight article "\\ \\[image*\\]\\ "              cyan  default
      highlight article "^https://.*"                     blue  default
      highlight article "^http://.*"                      blue  default
      highlight article "^Date:.*"                        green  default
      highlight article "\\*\ "                           magenta  default bold
      highlight article "\\[0-9]\\.\ "                    magenta  default bold
      highlight article "\\[[0-9][0-9]\\]:.*"             yellow   default bold
      highlight article "\\[[0-9]\\+\\]"                  yellow   default bold
      highlight article "\\[[^0-9].*[0-9]\\+\\]"          magenta  default bold

      show-read-articles no
      show-read-feeds no

      articlelist-format "%?T? %-17T | ?%t"

      macro v set browser "setsid -f mpv --really-quiet --no-terminal" ; open-in-browser ; set browser firefox
      player "mpv"

      bind-key RIGHT open
      bind-key LEFT quit

      macro s set show-read-articles yes; set show-read-feeds yes; reload
      macro h set show-read-articles no; set show-read-feeds no; reload

      bind-key l open
      bind-key j down
      bind-key k up
      bind-key h quit
    '';
    urls = [
      { url = ''"query:Youtube:tags # \"Youtube\""''; }
      { url = ''"query:Odysee:tags # \"Odysee\""''; }
      { url = ''"query:Piped:tags # \"Piped\""''; }
      { url = ''"query:Blog:tags # \"Blog\""''; }
      { url = ''"query:Wrocław:tags # \"Wrocław\""''; }
      { url = "http://localhost:8000/feed"; }
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
        tags = [
          "Youtube"
          "Programming"
        ];
        title = "devaslife";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0lE_IPPXhb_J9sZnMyIEwA";
        tags = [
          "Youtube"
          "Programming"
        ];
        title = "llll colonq";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";
        tags = [
          "Youtube"
          "Programming"
        ];
        title = "No Boilerplate";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCnCmb1vpv90EeSX5g7K4UYQ";
        tags = [
          "Youtube"
          "Games"
        ];
        title = "The Librarian";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_zBdZ0_H_jn41FDRG7q4Tw";
        tags = [
          "Youtube"
          "Nix"
        ];
        title = "Vimjoyer";
      }
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
      } # #Piped
      {
        url = "https://pipedapi.kavin.rocks/feed/rss?authToken=5f754893-4492-46a1-8d5a-bfbeb8def939";
        tags = [ "Piped" ];
      }
      #Blog
      {
        url = "https://terrysfreegameoftheweek.com/feed/";
        tags = [ "Games" ];
      }
      {
        url = "https://myme.no/feed.xml";
        tags = [
          "Linux"
          "Tech"
          "Blog"
        ];
      }
      {
        url = "https://emacsredux.com/atom.xml";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://emacstil.com/feed.xml";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://irreal.org/blog/?feed=rss2";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://mbork.pl/?action=rss;days=30;all=0;showedit=0;full=1";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://planet.emacslife.com/atom.xml";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://planet.clojure.in/atom.xml";
        tags = [
          "Tech"
          "Programming"
          "Blog"
        ];
      }
      {
        url = "https://xeiaso.net/blog.rss";
        tags = [
          "Tech"
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://xn--gckvb8fzb.com/index.xml";
        tags = [
          "Tech"
          "Linux"
          "Privacy"
          "Blog"
        ];
      }
      {
        url = "https://determinate.systems/rss.xml";
        tags = [
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://thewagner.net/feeds/all.atom.xml";
        tags = [
          "Nix"
          "Programming"
          "Homelab"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://nixcademy.com/feed";
        tags = [
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://itsfoss.com/rss/";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://blog.rust-lang.org/feed.xml";
        tags = [
          "Blog"
          "Programming"
        ];
      }
      {
        url = "https://thelinuxexp.com/feed.xml";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://thelinuxcast.org/feed/feed.xml";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://michal.sapka.me/index.xml";
        title = "Michal Sapka";
        tags = [
          "Blog"
          "BSD"
        ];
      }
      {
        url = "https://morss.it/https://fabiensanglard.net/rss.xml";
        tags = [
          "Blog"
          "Linux"
          "Tech"
        ];
      }
      {
        url = "https://morss.it/https://panoptykon.org/rss.xml";
        tags = [
          "Blog"
          "Politics"
        ];
      }
      {
        url = "https://zettelkasten.de/feed.atom";
        tags = [
          "Blog"
          "Notes"
        ];
      }
      {
        url = "https://blog.phundrak.com/index.xml";
        tags = [
          "Blog"
          "Tech"
          "Emacs"
        ];
      }
      {
        url = "https://vermaden.wordpress.com/feed";
        tags = [
          "Blog"
          "Tech"
          "BSD"
        ];
        title = "vermaden";
      }
      {
        url = "https://morss.it/https://fasterthanli.me/index.xml";
        tags = [
          "Blog"
          "Tech"
          "Programming"
        ];
      }
      {
        url = "https://morss.it/https://aliabdaal.com/feed/";
        tags = [
          "Blog"
          "Lifestyle"
        ];
      }
      {
        url = "https://programmershideaway.xyz/atom.xml";
        tags = [
          "Blog"
          "Programming"
        ];
      }
      {
        url = "https://morss.it/https://www.jeffgeerling.com/blog.xml";
        tags = [
          "Blog"
          "Tech"
        ];
      }
      {
        url = "https://ploum.net/atom_en.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://haseebmajid.dev/posts/index.xml";
        tags = [
          "Blog"
          "Nix"
        ];
      }
      {
        url = "https://heywoodlh.io/feed.xml";
        tags = [
          "Blog"
          "Nix"
        ];
      }
      {
        url = "http://dorotac.eu/atom.xml";
        tags = [
          "Blog"
          "Tech"
        ];
      }
      {
        url = "https://morss.it/https://signal.org/blog/rss.xml";
        tags = [
          "Blog"
          "Privacy"
        ];
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
        tags = [
          "Wrocław"
          "Culture"
        ];
      }
      {
        url = "https://morss.it/https://www.wroclaw.pl/komunikacja/rss/";
        tags = [ "Wrocław" ];
      }
      {
        url = "https://dcf.wroclaw.pl/feed/";
        tags = [
          "Wrocław"
          "Culture"
        ];
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
