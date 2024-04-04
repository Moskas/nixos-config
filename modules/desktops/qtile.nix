{

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "x11";
    extraPackages =
      python3Packages: with python3Packages; [
        aria2p
        mpd2
      ];
  };
}
