{ pkgs, ... }:

{
  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "368796cbc2e3d0a71726e02fe5338b002ca932bf";
      hash = "sha256-uAQrb2x7daChJYM1FWjbMv6YnClLpg9zHbJ41BZKxDk=";
    };
  };
}
