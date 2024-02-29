{ pkgs, ... }:

{

  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "18da7f2";
      sha256 = "sha256-E8QQqq8Tj2zSFofPoP1yWRKKr2hMaiSYLVOzsHyg0mo=";
    };
  };

}
