{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraPackages = epkgs:
      with epkgs; [
        vterm-toggle # Added as doom-emacs vterm won't compile due to read only directory
        elcord # Discord status
        mastodon
      ];
  };

  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacs-unstable;
    startWithUserSession = true;
  };
}
