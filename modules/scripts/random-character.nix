{ pkgs, ... }:

pkgs.writeShellScriptBin "random-nekopara-character"
  ''
    ${pkgs.catimg}/bin/catimg -w 125 "$(find $HOME/Pictures/Stickers/nekopara/*.png -type -f | shuf -n 1)"
  ''
