{ config, lib, pkgs, username, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles.${username} = {
      isDefault = true;
    };
  };
}
