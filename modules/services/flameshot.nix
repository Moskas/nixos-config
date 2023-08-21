{ config, lib, pkgs, username, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        autoCloseIdleDaemon = true;
        checkForUpdates = false;
        contrastOpacity = 188;
        saveAfterCopy = true;
        savePath = "/home/${username}/Pictures/Screenshots";
        savePathFixed = true;
        uiColor = "#fbf1c7";
        useJpgForClipboard = false;
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };
  };
}
