{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu";
      profile = "gpu-hq";
      force-window = true;
      #ytdl-format = "bestvideo+bestaudio";
      keepaspect = false;
      osc = false;
    };
    scripts = with pkgs.mpvScripts; [
      sponsorblock
      quality-menu
      mpris
      thumbnail
    ];
  };
}
