{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ispell
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraPackages =
      epkgs: with epkgs; [
        vterm-toggle
        vterm
        mu4e
      ];
  };

  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacs-unstable;
    startWithUserSession = "graphical";
  };
}
