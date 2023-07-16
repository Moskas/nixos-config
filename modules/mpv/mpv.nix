{ config, lib, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      force-window = true;
      #ytdl-format = "bestvideo+bestaudio";
      keepaspect = true;
      no-keepaspect-window = false;
      osc = false;
    };
    scripts = with pkgs.mpvScripts; [ sponsorblock youtube-quality mpris thumbnail ];
  };
}
