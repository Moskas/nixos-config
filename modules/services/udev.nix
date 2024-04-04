{ pkgs, ... }:
{
  services.udev = {
    enable = true;
    packages = [ "${pkgs.openrgb-with-all-plugins}/lib/udev/rules.d/60-openrgb.rules" ];
  };
}
