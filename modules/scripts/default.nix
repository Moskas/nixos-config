{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (callPackage ./cropshot.nix { })
    (callPackage ./fullshot.nix { })
  ];
}
