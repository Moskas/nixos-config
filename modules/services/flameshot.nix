{ config, username, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        autoCloseIdleDaemon = true;
        #checkForUpdates = false;
        contrastOpacity = 188;
        saveAfterCopy = true;
        savePath = "/home/${username}/Pictures/Screenshots";
        savePathFixed = true;
        uiColor = "#${config.colorScheme.palette.base07}";
        useJpgForClipboard = false;
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        showDesktopNotification = false;
      };
    };
  };
}
