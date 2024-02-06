{ config, pkgs, username, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles.${username} = { isDefault = true; };
  };
  home.packages = with pkgs; [ birdtray ];
}
