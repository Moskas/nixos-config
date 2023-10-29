{ config, lib, pkgs, ... }:

{

  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "850e424";
      sha256 = "sha256-wwLOKDaqBCrdfwa0wb07N3w6si/cFrQP6Mz2dmK79PA=";
    };
  };

}
