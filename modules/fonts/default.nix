{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
      noto-fonts-emoji
      ipafont
      kochi-substitute
    ];
  };
}
