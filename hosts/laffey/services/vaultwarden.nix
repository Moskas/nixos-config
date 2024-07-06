{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.vaultwarden = {
    enable = true;
  };
}
