{ pkgs, ... }:
{
  services.xserver.windowManager.stumpwm = {
    enable = true;
  };
  environment.systemPackages = with pkgs.sbclPackages; [
    anaphora
    alexandria
  ];
}
