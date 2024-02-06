{ config, pkgs, ... }:

{
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
  };
}

