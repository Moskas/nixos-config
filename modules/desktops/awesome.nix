{ pkgs, ... }:
{
  windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-git;
    luaModules = with pkgs.luaPackages; [ luarocks ];
  };
}
