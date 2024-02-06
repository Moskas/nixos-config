{ config, pkgs, ... }:

{

  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "8b8f6f8";
      sha256 = "sha256-bMcAhrG9Aj6NgnpOKzmw3/eZTvvXGtKaSti2lFrP56g=";
    };
  };

}
