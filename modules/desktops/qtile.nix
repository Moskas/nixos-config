{
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages =
      python3Packages: with python3Packages; [
        aria2p
        mpd2
        hy
      ];
  };
}
