{ pkgs, ... }: {
  home.packages = with pkgs; [
    protonup-ng
    #heroic
    steam-run
    protontricks
    bottles
    mangohud
    goverlay
    prismlauncher
    # yuzu # F
    jre8
    ferium
  ];
}
