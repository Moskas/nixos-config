{ config, pkgs, ... }:

{
  imports = [ ../../modules/services/ssh.nix ../../modules ];

  # Simply install just the packages
  environment.packages = with pkgs; [ ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
  '';

  # Setting terminal colors
  terminal.colors = {
    "foreground" = "#000000";
    "background" = "#FFFFFF";
    "color0" = "#777777";
    "color1" = "#777777";
    "color10" = "#777777";
    "color11" = "#777777";
    "color12" = "#777777";
    "color13" = "#777777";
    "color14" = "#777777";
    "color15" = "#777777";
    "color2" = "#777777";
    "color3" = "#777777";
    "color4" = "#777777";
    "color5" = "#777777";
    "color6" = "#777777";
    "color7" = "#777777";
    "color8" = "#777777";
    "color9" = "#777777";
  };

  # Set your time zone
  time.timeZone = "Europe/Warsaw";
}
