{ pkgs, ... }:

{
  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "132617ef4d36e54916878d2556f9477f9853e159";
      hash = "sha256-VJzyKWupxI0hU0LRH8bWYRQo73ZdaZIG8BjxMsz4VyU=";
    };
  };
}
