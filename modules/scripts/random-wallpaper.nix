{ pkgs, config, ... }:

pkgs.writeShellScriptBin "random-wallpaper" ''
  theme=$(echo "${config.colorScheme.slug}" | cut -d '-' -f 1)
  currenttime=$(date +"%k")
  if [[ "$currenttime" -ge "18" ]] || [[ "$currenttime" -lt "5" ]]; then
    wall_img="$(find /home/moskas/Pictures/Wallpapers/$theme/dark/*.{jpg,png} -type f | shuf -n 1)"
  else
    wall_img="$(find /home/moskas/Pictures/Wallpapers/$theme/light/*.{jpg,png} -type f | shuf -n 1)"
  fi
  ${pkgs.feh}/bin/feh --bg-fill $wall_img
  ${pkgs.libnotify}/bin/notify-send "Wallpaper set" "$wall_img" -i $wall_img
''
