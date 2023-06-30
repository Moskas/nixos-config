{ config, lib, pkgs, ... }:

{

  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "94bc6d9";
      sha256 = "sha256-EUQRHr7iWsNpucIyctTU/acEux1r2gZww1qAch+4igo=";
    };
  };

}
