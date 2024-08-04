{ pkgs, ... }:

{
  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "bbe7f088ce14c209c4b9efc962a0e3ac37b1e99a";
      hash = "sha256-uu7OUbic4e/rCW8fWKEg+oKH+WT3V7a09QzjZnxhuuU=";
    };
  };
}
