{ pkgs, ... }:

{
  programs.brave = {
    enable = true;
    extensions = [
      {
        id = "dcpihecpambacapedldabdbpakmachpb";
        updateUrl = "https://raw.githubusercontent.com/iamadamdev/bypass-paywalls-chrome/master/updates.xml";
      }
      {
        id = "nngceckbapebfimnlniiiahkandclblb"; # bitwarden
      }
      {
        id = "ajopnjidmegmdimjlfnijceegpefgped"; # BTTV
      }
      {
        id = "fadndhdgpmmaapbmfcknlfgcflmmmieb"; # FFZ
      }
    ];
  };

  home.packages = with pkgs; [
    (makeDesktopItem {
      name = "brave-private";
      desktopName = "Brave Web Browser";
      genericName = "Open a private Brave window";
      icon = "brave";
      exec = "${brave}/bin/brave --incognito";
      categories = [ "Network" ];
    })
  ];
}
