{ config, pkgs, nix-colors, ... }:
let inherit (nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in rec {
  gtk = {
    enable = true;
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme { scheme = config.colorScheme; };
    };
  };
}
