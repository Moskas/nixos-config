{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" ]; })
      noto-fonts-emoji
      ipafont
      kochi-substitute
    ];
  };
}
