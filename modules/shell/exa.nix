{ config, lib, pkgs, ... }:

{
    programs.exa = {
        enable = true;
        enableAliases = true;
        icons = true;
        git = true;
    };
}
