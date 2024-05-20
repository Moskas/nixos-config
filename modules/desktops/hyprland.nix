{ lib, config, ... }:

{
  programs.hyprland = {
    enable = false;
    xwayland.enable = true;
  };

  # Required due to nvidia drivers
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  #moskasHyprland = {
  #  options = {
  #    hyprlander = lib.mkOption {
  #      description = "Enable hyprland with config";
  #      type = lib.types.bool;
  #      default = false;
  #    };
  #  };
  #  config = lib.mkIf config.hyprlander {
  #    programs.hyprland = {
  #      enable = true;
  #      enableNvidiaPatches = true;
  #      xwayland.enable = true;
  #    };

  #    # Required due to nvidia drivers
  #    environment.sessionVariables = {
  #      WLR_NO_HARDWARE_CURSORS = "1";
  #      NIXOS_OZONE_WL = "1";
  #    };
  #  };
  #};
}
