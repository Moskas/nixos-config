{ pkgs, username, ... }:

{
  home.packages = with pkgs; [
    (callPackage ../../pkgs/mpdnotify.nix { })
    mpc-cli
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
    network = {
      listenAddress = "any";
      port = 6600;
    };
    extraConfig = ''
      audio_output {
      type  "pipewire"
      name  "My Pipewire"
      }
      audio_output {
      type    "fifo"
      name    "my_fifo"
      path    "/tmp/mpd.fifo"
      format  "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      taglibSupport = true;
      outputsSupport = true;
    };
    mpdMusicDir = "~/Music";
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      visualizer_type = "spectrum";
      visualizer_look = "+";
      song_library_format = "{{%a - %t}|{%f}}{$R%l}";
      song_status_format = "{{%a{ - %t}}|{ - %f}{ - %b{ (%y)}}}";
      progressbar_look = "── ";
      progressbar_color = "black";
      statusbar_visibility = "yes";
      now_playing_prefix = "$b$5";
      now_playing_suffix = "$/b$9";
      playlist_shorten_total_times = "yes";
    };
    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "J";
        command = [ "select_item" "scroll_down" ];
      }
      {
        key = "K";
        command = [ "select_item" "scroll_up" ];
      }
    ];
  };

  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      hosts = [ "localhost:6600" ];
      format = {
        details = "$title";
        state = "On $album by $artist";
      };
    };
  };
}
