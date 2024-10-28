{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraPackages =
      epkgs: with epkgs; [
        vterm-toggle
        vterm
      ];
  };

  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacs-unstable;
    startWithUserSession = "graphical";
  };

  home.packages = with pkgs; [ ispell ];
}
