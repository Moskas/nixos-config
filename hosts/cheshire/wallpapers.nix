{ config, lib, pkgs, ... }:

{

  home.file = {
    "./Pictures/Wallpapers/".source = pkgs.fetchFromGitHub {
      owner = "Moskas";
      repo = "wallpapers";
      rev = "6d33ce9";
      sha256 = "sha256-clp3yvP09bDPsMTxsSAZfehYHy889l5JtpMYaQ+NON8=";
    };
  };

}
