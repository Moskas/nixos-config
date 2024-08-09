{ pkgs, ... }:
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
    #(callPackage ../../../pkgs/etterna.nix { })
    #osu-lazer-bin
    jre8 # for old Minecraft versions
    ferium
    # gamingPkgs.osu-stable # mime conflicts with osu!lazer
    modrinth-app-unwrapped
    stepmania
    vintagestory
    (writeShellScriptBin "etterna" ''
      nix run "github:thiagokokada/nix-alien#nix-alien-ld" -- ~/Games/Etterna/Etterna
    '') # Just a hack teehee
    (writeShellScriptBin "itgmania" ''
      nix run "github:thiagokokada/nix-alien#nix-alien" -- ~/Games/itgmania/itgmania
    '')
  ];
}
