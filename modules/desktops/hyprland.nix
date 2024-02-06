{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = false;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  # Required due to nvidia drivers
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
