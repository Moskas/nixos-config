{ pkgs, config, ... }:

{
  stylix = {
    enable = false;
    image = ../wallpapers/desktop-cheshire-dark.png;
    #base16Scheme = ./colorschemes/matcha-dark.yaml;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      size = 16;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrains Mono Nerd Font";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
  };
}
