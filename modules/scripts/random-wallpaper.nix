{ pkgs, ... }:

pkgs.writeShellScriptBin "random-wallpaper"
  ''
    currenttime=$(date +"%k")
    if [[ "$currenttime" -ge "18" ]] || [[ "$currenttime" -lt "5" ]]; then
      wall_img="$(find /home/moskas/Pictures/Wallpapers/gruvbox/dark/* -type f | shuf -n 1)"
    else
      wall_img="$(find /home/moskas/Pictures/Wallpapers/gruvbox/light/* -type f | shuf -n 1)"
    fi
    ${pkgs.feh}/bin/feh --bg-fill $wall_img
    ${pkgs.libnotify}/bin/notify-send "Wallpaper set" -i $wall_img
  ''
