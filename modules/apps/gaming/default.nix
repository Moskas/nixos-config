{ pkgs, gamingPkgs, ... }:
{
  home.packages = with pkgs; [
    protonup-ng
    #heroic
    steam-run
    protontricks
    wineWowPackages.stable
    winetricks
    bottles
    mangohud
    goverlay
    prismlauncher
    # yuzu # F
    (callPackage ../../../pkgs/osu-bin.nix { })
    jre8 # for old Minecraft versions
    ferium
    gamingPkgs.osu-stable
  ];
}
