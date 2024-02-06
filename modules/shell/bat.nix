{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      color = "always";
      #pager = "less -FR";
    };
  };
}
