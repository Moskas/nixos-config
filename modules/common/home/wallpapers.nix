{ pkgs, ... }:

{
  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "d5a43ea54482e52ed058ae73446ac0b8abb82074";
      hash = "sha256-aRESz2MvGWQi9eLf/i125aD8GqOiXGUeO9xd43jk58g=";
    };
  };
}
