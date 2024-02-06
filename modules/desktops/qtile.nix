{ config, pkgs, ... }:

{
  windowManager.qtile = {
    enable = true;
    backend = "x11";
    extraPackages = [ ];
  };

}
