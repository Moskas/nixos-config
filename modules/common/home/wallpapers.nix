{ pkgs, ... }:

{
  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "900c77807c86a865421f133c7a0e91c9d2620cb4";
      hash = "sha256-XwVH95WhpasgoUNKq3+nFN7MrlNLe9RVAgXewZ23WMI=";
    };
  };
}
