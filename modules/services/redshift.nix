{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    provider = "manual";
    latitude = 52.2297;
    longitude = 21.0122;
  };
}
